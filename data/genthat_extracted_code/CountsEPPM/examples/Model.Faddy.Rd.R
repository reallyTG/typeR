library(CountsEPPM)


### Name: Model.Faddy
### Title: Function for Faddy distribution with log link.
### Aliases: Model.Faddy
### Keywords: models

### ** Examples

all.counts=c(rep(0,5), 352, 479, 530, 291, 101, 17)
nmax1  <- length(all.counts)
nmax   <- nmax1 - 1
cnum   <- 0:nmax
ncount <- sum(all.counts)  
all.mean <- t(cnum) 
alldata <- data.frame(all.mean)
mf <- model.frame(formula = all.mean ~ 1, data = alldata)
covariates.matrix.mean <- model.matrix(attr(mf, "terms"), data = mf)
list.counts <- list(all.counts)
parameter <- c(53.047752, -13.205655, 3.801599)
names(parameter) <- c('log(a)', 'c', 'log(b)') 
model.name <- 'Faddy distribution'
link <- "log"
attr(link, which="mean") <- make.link(link)
offset.mean <- matrix(c(rep(0, nrow(covariates.matrix.mean))), ncol=1)
output <- Model.Faddy(parameter, model.name, link,
 covariates.matrix.mean, offset.mean, fixed.b = NA,
 vnmax = c(10))
print(output)



