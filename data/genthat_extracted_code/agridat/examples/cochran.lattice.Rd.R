library(agridat)


### Name: cochran.lattice
### Title: Balanced lattice experiment in cotton
### Aliases: cochran.lattice
### Keywords: datasets

### ** Examples


data(cochran.lattice)
dat <- cochran.lattice

if(require(desplot)){
  desplot(y~row*col|rep, dat,
          text=trt, # aspect unknown, should be 2 or .5
          main="cochran.lattice")
}

## Not run: 
##D   # Random rep,row,column model often used by Federer
##D   require(lme4)
##D   dat <- transform(dat, rowf=factor(row), colf=factor(col))
##D   m1 <-  lmer(y ~ trt + (1|rep) + (1|rep:row) + (1|rep:col), data=dat)
##D   summary(m1)
## End(Not run)




