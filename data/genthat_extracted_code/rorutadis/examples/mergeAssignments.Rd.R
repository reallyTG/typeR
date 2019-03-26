library(rorutadis)


### Name: mergeAssignments
### Title: Merge different assignments
### Aliases: mergeAssignments

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
DM1Problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))
DM2Problem <- addAssignmentsLB(problem, c(2, 2), c(4, 2))

necessary <- FALSE
assignmentList <- list()
assignmentList[[1]] <- calculateAssignments(DM1Problem, necessary)
assignmentList[[2]] <- calculateAssignments(DM2Problem, necessary)

# generate possible - necessary assignments
PNAssignments <- mergeAssignments(assignmentList, TRUE)



