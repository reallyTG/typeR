library(matchingR)


### Name: galeShapley.collegeAdmissions
### Title: Gale-Shapley Algorithm: College Admissions Problem
### Aliases: galeShapley.collegeAdmissions

### ** Examples

ncolleges = 10
nstudents = 25

# randomly generate cardinal preferences of colleges and students
collegeUtils = matrix(runif(ncolleges*nstudents), nrow=nstudents, ncol=ncolleges)
studentUtils = matrix(runif(ncolleges*nstudents), nrow=ncolleges, ncol=nstudents)

# run the student-optimal algorithm
results.studentoptimal = galeShapley.collegeAdmissions(studentUtils = studentUtils,
                              collegeUtils = collegeUtils,
                              slots = 2,
                              studentOptimal = TRUE)
results.studentoptimal

# run the college-optimal algorithm
results.collegeoptimal = galeShapley.collegeAdmissions(studentUtils = studentUtils,
                              collegeUtils = collegeUtils,
                              slots = 2,
                              studentOptimal = FALSE)
results.collegeoptimal

# transform the cardinal utilities into preference orders
collegePref = sortIndex(collegeUtils)
studentPref = sortIndex(studentUtils)

# run the student-optimal algorithm
results.studentoptimal = galeShapley.collegeAdmissions(studentPref = studentPref,
                             collegePref = collegePref,
                             slots = 2,
                             studentOptimal = TRUE)
results.studentoptimal

# run the college-optimal algorithm
results.collegeoptimal = galeShapley.collegeAdmissions(studentPref = studentPref,
                             collegePref = collegePref,
                             slots = 2,
                             studentOptimal = FALSE)
results.collegeoptimal



