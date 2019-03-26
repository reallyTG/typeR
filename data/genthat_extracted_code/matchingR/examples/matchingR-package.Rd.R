library(matchingR)


### Name: matchingR-package
### Title: matchingR: Matching Algorithms in R and C++
### Aliases: matchingR matchingR-package

### ** Examples

# stable marriage problem
set.seed(1)
nmen = 25
nwomen = 20
uM = matrix(runif(nmen*nwomen), nrow=nwomen, ncol=nmen)
uW = matrix(runif(nwomen*nmen), nrow=nmen, ncol=nwomen)
results = galeShapley.marriageMarket(uM, uW)
galeShapley.checkStability(uM, uW, results$proposals, results$engagements)

# college admissions problem
nstudents = 25
ncolleges = 5
uStudents = matrix(runif(nstudents*ncolleges), nrow=ncolleges, ncol=nstudents)
uColleges = matrix(runif(nstudents*ncolleges), nrow=nstudents, ncol=ncolleges)
results = galeShapley.collegeAdmissions(studentUtils = uStudents,
                                        collegeUtils = uColleges,
                                        slots = 4)
results
# check stability
galeShapley.checkStability(uStudents,
                           uColleges,
                           results$matched.students,
                           results$matched.colleges)

# stable roommate problem
set.seed(2)
N = 10
u = matrix(runif(N^2),  nrow = N, ncol = N)
results = roommate(utils = u)
results
# check stability
roommate.checkStability(utils = u, matching = results)

# top trading cycle algorithm
N = 10
u = matrix(runif(N^2),  nrow = N, ncol = N)
results = toptrading(utils = u)
results
# check stability
toptrading.checkStability(utils = u, matching = results)



