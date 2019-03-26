library(BinaryEPPM)


### Name: Model.Binary
### Title: Function for obtaining output from distributional models.
### Aliases: Model.Binary
### Keywords: models

### ** Examples

link <- 'cloglog'
attr(link, which="p") <- make.link(link)
parameter <- c(-0.68294630,0.03451481)
names(parameter) <- c('p','rho')
model.type <- 'p and scale-factor'
model.name <- 'correlated binomial'
ntrials    <- list(c(rep(10,11)))
output <- Model.Binary(parameter, model.type, model.name, link, ntrials,
                covariates.matrix.p = matrix(c(1),nrow=1), 
                covariates.matrix.scalef = matrix(c(1),nrow=1),
                offset.p = c(0), offset.scalef = c(0))
print(output)



