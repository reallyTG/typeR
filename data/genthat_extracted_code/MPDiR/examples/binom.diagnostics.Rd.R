library(MPDiR)


### Name: binom.diagnostics
### Title: Diagnostics for Binary GLM
### Aliases: binom.diagnostics plot.binom.diag
### Keywords: models hplot

### ** Examples

## Not run: 
##D # generate psychometric function and binary data
##D levs <-  10^seq(-2, 0, len = 5)
##D psyF <-  pnorm(levs, mean = 0.2, sd = 0.2)
##D Ntrials <- 100
##D Resp <- rbinom(Ntrials * length(psyF), 1, psyF)
##D d.df <- data.frame(resp = Resp, levs = levs)
##D fit.glm <-  glm(resp ~ levs, binomial, d.df)
##D fit.diag <- binom.diagnostics(fit.glm)
##D plot(fit.diag)
## End(Not run)



