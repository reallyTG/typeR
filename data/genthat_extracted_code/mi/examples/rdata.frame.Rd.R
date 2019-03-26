library(mi)


### Name: rdata.frame
### Title: Generate a random data.frame with tunable characteristics
### Aliases: rdata.frame
### Keywords: utilities

### ** Examples

rdf <- rdata.frame(n_partial = 2, df = 5, alpha = rnorm(5))
print(rdf$empirical_CPCs) # not zero
rdf <- rdata.frame(n_partial = 2, restrictions = "triangular", alpha = NA)
print(rdf$empirical_CPCs) # only randomly different from zero
print(rdf$L == 0) # some are exactly zero by construction
mdf <- missing_data.frame(rdf$obs)
show(mdf)
hist(mdf)
image(mdf)
# a randomized experiment
rdf <- rdata.frame(n_full = 2, n_partial = 2, 
                   restrictions = "triangular", experiment = TRUE,
                   types = c("t", "ord", "con", "pos"),
                   treatment_cor = c(0, 0, NA, 0, NA))
Sigma <- tcrossprod(rdf$L)
rownames(Sigma) <- colnames(Sigma) <- c("treatment", "X_2", "y_1", "Y_2",
                                        "missing_y_1", "missing_Y_2")
print(round(Sigma, 3))



