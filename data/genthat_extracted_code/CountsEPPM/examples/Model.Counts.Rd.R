library(CountsEPPM)


### Name: Model.Counts
### Title: Function for obtaining output from distributional models.
### Aliases: Model.Counts
### Keywords: models

### ** Examples

all.counts=c(rep(0,5),352,479,530,291,101,17)
nmax1  <- length(all.counts)
nmax   <- nmax1 - 1
cnum   <- 0:nmax
ncount <- sum(all.counts)  
all.mean <- sum(cnum*all.counts)/ncount 
all.scalef <- ((sum(cnum*cnum*all.counts) - ncount*all.mean*all.mean) / (ncount - 1)) / all.mean
alldata <- data.frame(all.mean, all.scalef)
mf  <- model.frame(formula = all.mean~1 ,data=alldata)
covariates.matrix.mean <- model.matrix(attr(mf,"terms"), data=mf)
mf  <- model.frame(formula = all.scalef~1, data = alldata)
covariates.matrix.scalef <- model.matrix(attr(mf,"terms"), data = mf)
list.counts <- list(all.counts)
parameter <- c(1.8388023, 0.6009881)
names(parameter) <- c("beta0 log(mean)" ,"beta0 log(scale-factor)") 
offset.mean     <- matrix(c(rep(0, nrow(covariates.matrix.mean))), ncol=1)
offset.scalef <- matrix(c(rep(0, nrow(covariates.matrix.mean))), ncol=1)
link <- "log"
attr(link, which="mean") <- make.link(link)
output <- Model.Counts(parameter, model.type = "mean and scale-factor",
 model.name = "limiting", link, covariates.matrix.mean,
 covariates.matrix.scalef, offset.mean, offset.scalef,
 fixed.b = NA, vnmax = c(10))
print(output)



