CREATE DATABASE sgms_db;
USE sgms_db;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    admin_uname VARCHAR(50),
    admin_pass VARCHAR(50)
);

INSERT INTO departments VALUES 
(1, 'IT Department', 'admin_it', 'pass123'),
(2, 'Harassment Cell', 'admin_safety', 'pass123'),
(3, 'Finance & Fees', 'admin_fees', 'pass123'),
(4, 'Exam Cell', 'admin_exam', 'pass123');

CREATE TABLE complaints (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(50),
    dept_id INT,
    category ENUM('Academic', 'Harassment', 'Facilities', 'Emergency'),
    description TEXT,
    status VARCHAR(20) DEFAULT 'Under Review',
    is_emergency BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

CREATE TABLE messages (
    m_id INT PRIMARY KEY AUTO_INCREMENT,
    complaint_id INT,
    sender VARCHAR(50),
    msg_text TEXT,
    msg_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
