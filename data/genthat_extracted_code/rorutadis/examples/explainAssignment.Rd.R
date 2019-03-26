library(rorutadis)


### Name: explainAssignment
### Title: Explain assignment
### Aliases: explainAssignment

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.5), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

possibleAssignments <- calculateAssignments(problem, FALSE)
alternative <- 4
assignment <- c(min(which(possibleAssignments[alternative, ])),
               max(which(possibleAssignments[alternative, ])))

preferentialReducts <- explainAssignment(alternative,
   assignment, problem)
preferentialCore <- getPreferentialCore(preferentialReducts)
coreRestrictions <- getRestrictions(problem, preferentialCore)



