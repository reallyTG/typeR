library(Anthropometry)


### Name: nearestToArchetypes
### Title: Nearest individuals to archetypes
### Aliases: nearestToArchetypes
### Keywords: array

### ** Examples

#COCKPIT DESIGN PROBLEM:
#As a toy example, only the first 25 individuals are used.
USAFSurvey_First25 <- USAFSurvey[1:25, ]
#Variable selection:
variabl_sel <- c(48, 40, 39, 33, 34, 36)
#Changing to inches: 
USAFSurvey_First25_inch <- USAFSurvey_First25[,variabl_sel] / (10 * 2.54)

#Data preprocessing:
USAFSurvey_preproc <- preprocessing(USAFSurvey_First25_inch, TRUE, 0.95, TRUE)

res <- archetypesBoundary(USAFSurvey_preproc$data, 5, FALSE, 3)
#To understand the warning messages, see the vignette of the
#archetypes package.  

numArch <- 3
a3 <- archetypes::bestModel(res[[numArch]])
ras <- rbind(archetypes::parameters(a3), USAFSurvey_preproc$data)
dras <- dist(ras, method = "euclidean", diag = FALSE, upper = TRUE, p = 2)
mdras <- as.matrix(dras)
diag(mdras) <- 1e+11
sapply(seq(length=numArch), nearestToArchetypes, numArch, mdras) 



