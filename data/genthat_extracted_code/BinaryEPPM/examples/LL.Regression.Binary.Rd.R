library(BinaryEPPM)


### Name: LL.Regression.Binary
### Title: Function called by optim to calculate the log likelihood from
###   the probabilities and hence perform the fitting of regression models
###   to the binary data.
### Aliases: LL.Regression.Binary
### Keywords: model

### ** Examples

link <- 'cloglog'
attr(link, which="p") <- make.link(link)
nsuccess <- list(c(rep(0,5),352,479,530,291,101,17))
ntrials  <- list(c(rep(10,11)))
parameter <- c(0.06363398,-0.47085362)
output <- LL.Regression.Binary(parameter, model.type = "p and scale-factor",
            model.name = "generalized binomial", link, ntrials, nsuccess, 
            covariates.matrix.p = matrix(c(1), nrow=1),
            covariates.matrix.scalef = matrix(c(1), nrow=1),
            offset.p = c(0), offset.scalef = c(0),
            weights = list(c(rep(1,11)))) 
print(output)



