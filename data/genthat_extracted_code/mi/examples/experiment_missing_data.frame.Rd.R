library(mi)


### Name: experiment_missing_data.frame
### Title: Class "experiment_missing_data.frame"
### Aliases: experiment_missing_data.frame
###   experiment_missing_data.frame-class
### Keywords: classes manip AimedAtUseRs

### ** Examples

rdf <- rdata.frame(n_full = 2, n_partial = 2, 
                   restrictions = "stratified", experiment = TRUE,
                   types = c("t", "ord", "con", "pos"),
                   treatment_cor = c(0, 0, NA, 0, NA))
Sigma <- tcrossprod(rdf$L)
rownames(Sigma) <- colnames(Sigma) <- c("treatment", "X_2", "y_1", "Y_2",
                                        "missing_y_1", "missing_Y_2")
print(round(Sigma, 3))

concept <- as.factor(c("treatment", "covariate", "covariate", "outcome"))
mdf <- missing_data.frame(rdf$obs, subclass = "experiment", concept = concept)



