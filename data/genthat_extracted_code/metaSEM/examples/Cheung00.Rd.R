library(metaSEM)


### Name: Cheung00
### Title: Fifty Studies of Correlation Matrices used in Cheung and Chan
###   (2000)
### Aliases: Cheung00
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Cheung00)
##D 
##D ## Variable labels
##D labels <- colnames(Cheung00$data[[1]])
##D 
##D ## Full mediation model
##D S <- create.mxMatrix(c("1", 
##D                        ".2*cov_att_sn", "1", 
##D                        0, 0, ".2*e_bi", 
##D                        0, 0, 0, ".2*e_beh"), 
##D                      type="Symm", as.mxMatrix=FALSE, byrow=TRUE)
##D dimnames(S) <- list(labels, labels)
##D S
##D 
##D A <- matrix(c("0","0","0","0",
##D               "0","0","0","0",
##D               ".2*att2bi", ".2*sn2bi", "0", "0",
##D               "0", "0", ".2*bi2beh", "0"),
##D             byrow=TRUE, 4, 4)
##D dimnames(A) <- list(labels, labels)
##D A
##D 
##D #### Random-effects model
##D 
##D ## Stage 1 analysis
##D random_1 <- tssem1(Cheung00$data, Cheung00$n, method="REM", RE.type="Symm",
##D                    acov="individual")
##D summary(random_1)
##D 
##D ## Stage 2 analysis
##D random_2 <- tssem2(random_1, Amatrix=A, Smatrix=S, intervals.type="LB",
##D                    diag.constraints=TRUE)
##D summary(random_2)
##D 
##D ## Display the model
##D plot(random_2, what="path")
##D 
##D ## Display the model with the parameter estimates
##D plot(random_2, color="yellow")
##D 
##D ## Load the library
##D library("semPlot")
## End(Not run)



