-- جدول الأقسام
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);
--------------------------------------------------------------------------------
-- جدول المدرسين
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
------------------------------------------------------------------------------
-- جدول المواد الدراسية
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
--------------------------------------------------------------------------
-- جدول الطلاب
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    grade_level VARCHAR(10) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);
---------------------------------------------------------------------------
-- جدول التسجيلات
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
---------------------------------------------------------------------------
-- جدول الدرجات
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    letter_grade CHAR(2) NOT NULL,
    exam_type ENUM('Midterm', 'Final', 'Quiz') NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);
-------------------------------------------------------------------------

-- #########################################
-- # 2. إدخال البيانات                    #
-- #########################################
----------------------------------------------------------------------------
-- إدخال بيانات الأقسام
INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Biology'),
('Chemistry'),
('English Literature'),
('History'),
('Art'),
('Music'),
('Philosophy');
-----------------------------------------------------------------------------
-- إدخال بيانات المدرسين
INSERT INTO Teachers (department_id, first_name, last_name, email) VALUES
(1, 'Mohamed', 'Gehad', 'moh.geh@example.com'),
(2, 'Mahmoud', 'Khamis', 'mah.kham@example.com'),
(3, 'Youssef', 'Khalifa', 'joey.khalifa@example.com'),
(4, 'Mohammed', '3zzat', 'moh.3zzat@example.com'),
(5, 'Abdullah', 'Bayoud', 'abdullah.bauoudy@example.com'),
(6, 'Ahmed', 'Al-Jiar', 'ahmed.jiary@example.com'),
(7, 'Mariam', 'Wilson', 'mariam.wilson@example.com'),
(8, 'Marwan', 'Musa', 'maro.musa@example.com'),
(9, 'Jessica', 'Anderson', 'jessica.anderson@example.com'),
(10, 'Robert', 'Lee', 'robert.lee@example.com'); 
----------------------------------------------------------------------------
-- إدخال بيانات المواد
INSERT INTO Subjects (department_id, subject_name, credits) VALUES
(1, 'Introduction to Programming', 3),
(1, 'Data Structures', 4),
(2, 'Calculus', 3),
(3, 'Quantum Mechanics', 4),
(4, 'Biology Basics', 3),
(5, 'Organic Chemistry', 3),
(6, 'Shakespeare Studies', 4),
(7, 'World War II History', 3),
(8, 'Painting Techniques', 4),
(9, 'Music Theory', 3);
---------------------------------------------------------------------------
-- إدخال بيانات الطلاب
INSERT INTO Students (first_name, last_name, grade_level, gender, date_of_birth, address, city, country) VALUES
('Alice', 'Wong', 'Freshman', 'F', '2000-05-15', '123 Main St', 'New York', 'USA'),
('Bob', 'Lee', 'Sophomore', 'M', '1999-08-20', '456 Elm St', 'Los Angeles', 'USA'),
('Charlie', 'Chen', 'Junior', 'M', '1998-03-10', '789 Oak St', 'Chicago', 'USA'),
('David', 'Nguyen', 'Senior', 'M', '1997-11-05', '321 Pine St', 'Houston', 'USA'),
('Eva', 'Martinez', 'Sophomore', 'F', '2000-07-25', '567 Maple St', 'San Francisco', 'USA'),
('Liam', 'Hernandez', 'Junior', 'M', '1998-09-10', '890 Birch St', 'Seattle', 'USA'),
('Olivia', 'Garcia', 'Senior', 'F', '1997-02-15', '345 Cedar St', 'Denver', 'USA'),
('Noah', 'Rodriguez', 'Freshman', 'M', '2001-11-03', '678 Pine St', 'Austin', 'USA'),
('Emma', 'Lopez', 'Sophomore', 'F', '2000-04-20', '901 Oak St', 'Dallas', 'USA'),
('Daniel', 'Kim', 'Junior', 'M', '1999-06-18', '111 Spruce St', 'Miami', 'USA');
---------------------------------------------------------------------------
-- إدخال بيانات التسجيلات
INSERT INTO Enrollments (subject_id, teacher_id, student_id, enrollment_date) VALUES
(1, 1, 1, '2023-09-01'),
(2, 1, 2, '2023-09-01'),
(3, 2, 3, '2023-09-01'),
(4, 3, 4, '2023-09-01'),
(5, 4, 1, '2023-09-01'),
(6, 5, 5, '2023-09-01'),
(7, 6, 6, '2023-09-01'),
(8, 7, 7, '2023-09-01'),
(9, 8, 8, '2023-09-01'),
(10, 9, 9, '2023-09-01');
------------------------------------------------------------------------------
-- إدخال بيانات الدرجات
INSERT INTO Grades (enrollment_id, score, letter_grade, exam_type) VALUES
(1, 85.5, 'B+', 'Final'),
(2, 92.0, 'A-', 'Midterm'),
(3, 78.0, 'C+', 'Quiz'),
(4, 88.5, 'A-', 'Final'),
(5, 95.0, 'A+', 'Final'),
(6, 88.0, 'B+', 'Final'),
(7, 91.5, 'A-', 'Midterm'),
(8, 75.0, 'C+', 'Quiz'),
(9, 89.5, 'A-', 'Final'),
(10, 94.0, 'A+', 'Final');


--------------------------------------------------------------------------

-- 1. إظهار الطلاب المسجلين في مادة معينة
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    sb.subject_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Subjects sb ON e.subject_id = sb.subject_id
WHERE 
    sb.subject_name = 'Introduction to Programming';

-- 2. إظهار المدرسين وأقسامهم
SELECT 
    t.teacher_id, 
    t.first_name, 
    t.last_name, 
    d.department_name
FROM 
    Teachers t
JOIN 
    Departments d ON t.department_id = d.department_id;

-- 3. إظهار عدد الطلاب المسجلين في كل مادة
SELECT 
    sb.subject_name, 
    COUNT(e.student_id) AS total_students
FROM 
    Subjects sb
LEFT JOIN 
    Enrollments e ON sb.subject_id = e.subject_id
GROUP BY 
    sb.subject_name;

-- 4. إظهار الطلاب الذين حصلوا على درجات أعلى من 90
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    g.score, 
    g.letter_grade
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Grades g ON e.enrollment_id = g.enrollment_id
WHERE 
    g.score > 90;

-- 5. إظهار المواد التي لم يسجل فيها أي طالب
SELECT 
    sb.subject_name
FROM 
    Subjects sb
LEFT JOIN 
    Enrollments e ON sb.subject_id = e.subject_id
WHERE 
    e.enrollment_id IS NULL;

-----------------------------------------------------------------------

    -- إنشاء المستخدم
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password123';

-- منح جميع الصلاحيات على قاعدة البيانات EduManage
GRANT ALL PRIVILEGES ON EduManage.* TO 'admin'@'localhost';

-- تحديث الصلاحيات
FLUSH PRIVILEGES;

-------------------------------------------------------------------


-- إنشاء المستخدم
CREATE USER 'teacher'@'localhost' IDENTIFIED BY 'password123';

-- منح صلاحية القراءة، الإدخال، والتحديث فقط على جداول Grades وEnrollments
GRANT SELECT, INSERT, UPDATE ON EduManage.Grades TO 'teacher'@'localhost';
GRANT SELECT ON EduManage.Enrollments TO 'teacher'@'localhost';

-- تحديث الصلاحيات
FLUSH PRIVILEGES;

-------------------------------------------------------------------


-- إنشاء المستخدم
CREATE USER 'student'@'localhost' IDENTIFIED BY 'password123';

-- منح صلاحية القراءة فقط على جداول الدرجات والتسجيلات
GRANT SELECT ON EduManage.Grades TO 'student'@'localhost';
GRANT SELECT ON EduManage.Enrollments TO 'student'@'localhost';

-- تحديث الصلاحيات
FLUSH PRIVILEGES;

--------------------------------------------------------------------


-- إنشاء المستخدم
CREATE USER 'registrar'@'localhost' IDENTIFIED BY 'password123';

-- منح صلاحية التعامل مع بيانات الطلاب والمقررات فقط
GRANT SELECT, INSERT, UPDATE ON EduManage.Students TO 'registrar'@'localhost';
GRANT SELECT, INSERT ON EduManage.Enrollments TO 'registrar'@'localhost';

-- تحديث الصلاحيات
FLUSH PRIVILEGES;



-------------------------------------------------------------------
-- إنشاء المستخدم
CREATE USER 'parent'@'localhost' IDENTIFIED BY 'password123';

-- منح صلاحية القراءة فقط على الجداول المتعلقة بالدرجات والتسجيلات
GRANT SELECT ON EduManage.Grades TO 'parent'@'localhost';
GRANT SELECT ON EduManage.Enrollments TO 'parent'@'localhost';

-- تحديث الصلاحيات
FLUSH PRIVILEGES;