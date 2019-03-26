library(ltm)


### Name: factor.scores
### Title: Factor Scores - Ability Estimates
### Aliases: factor.scores factor.scores.gpcm factor.scores.grm
###   factor.scores.ltm factor.scores.rasch factor.scores.tpm
### Keywords: methods

### ** Examples


## Factor Scores for the Rasch model
fit <- rasch(LSAT)
factor.scores(fit) # Empirical Bayes


## Factor scores for all subjects in the
## original dataset LSAT
factor.scores(fit, resp.patterns = LSAT)


## Factor scores for specific patterns,
## including NA's, can be obtained by 
factor.scores(fit, resp.patterns = rbind(c(1,0,1,0,1), c(NA,1,0,NA,1)))


## Not run: 
##D ## Factor Scores for the two-parameter logistic model
##D fit <- ltm(Abortion ~ z1)
##D factor.scores(fit, method = "MI", B = 20) # Multiple Imputation
##D 
##D ## Factor Scores for the graded response model
##D fit <- grm(Science[c(1,3,4,7)])
##D factor.scores(fit, resp.patterns = rbind(1:4, c(NA,1,2,3)))
## End(Not run)



