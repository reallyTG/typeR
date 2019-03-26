library(rubias)


### Name: gsi_em_1
### Title: EM algorithm from the simplest GSI model for pi and the
###   individual posterior probabilities
### Aliases: gsi_em_1
### Keywords: internal

### ** Examples

# this is shown with a scaled likelihood matrix from self-assignment
# of the reference individuals
params <- tcf2param_list(alewife, 17)
logl <- geno_logL(params)
SL <- apply(exp(logl), 2, function(x) x/sum(x))
test_em <- gsi_em_1(SL,
                    rep(1/params$C, params$C),
                    max_iterations = 10^6,
                    tolerance = 10^-7,
                    return_progression = TRUE)



