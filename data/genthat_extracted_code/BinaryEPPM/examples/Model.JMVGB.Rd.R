library(BinaryEPPM)


### Name: Model.JMVGB
### Title: Probabilities for generalized binomial distributions given p's
###   and scale-factors.
### Aliases: Model.JMVGB
### Keywords: models

### ** Examples

link <- 'cloglog'
attr(link, which="p") <- make.link(link)
parameter <- c(-0.68294630,0.03451481)
names(parameter) <- c('p','scale-factor')
model.name <- 'generalized binomial'
ntrials <- list(c(rep(10,11)))
output <- Model.JMVGB(parameter, model.name, link, ntrials, 
                      covariates.matrix.p = matrix(c(1),nrow=1), 
                      covariates.matrix.scalef = matrix(c(1),nrow=1), 
                      offset.p = c(0), offset.scalef = c(0))
print(output)



