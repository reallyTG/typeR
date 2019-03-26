library(BinaryEPPM)


### Name: Model.GB
### Title: Probabilities for binomial and generalized binomial
###   distributions given p's and b.
### Aliases: Model.GB
### Keywords: models

### ** Examples

link <- 'cloglog'
attr(link, which="p") <- make.link(link)
parameter <- c(0.9423342,0.5846321)
names(parameter) <- c('p','b')
model.name <- 'generalized binomial'
ntrials <- list(c(rep(10,11)))
output <- Model.GB(parameter, model.name, link, ntrials, 
                   covariates.matrix.p = matrix(c(1),ncol=1), 
                   offset.p = c(0))
print(output)



