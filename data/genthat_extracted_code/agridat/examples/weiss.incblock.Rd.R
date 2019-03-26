library(agridat)


### Name: weiss.incblock
### Title: Soybean balanced incomplete block experiment
### Aliases: weiss.incblock
### Keywords: datasets

### ** Examples


data(weiss.incblock)
dat <- weiss.incblock

# True aspect as shown in Weiss and Cox
if(require(desplot)){
  desplot(yield~col*row, dat,
          text=gen, shorten='none', cex=.6, out1=block,
          aspect=252/96, # true aspect
          main="weiss.incblock")
}


## Not run: 
##D   # Standard inc block analysis used by Weiss and Cox
##D   require(asreml)
##D   m1 <- asreml(yield ~ gen + block , data=dat)
##D   predict(m1, data=dat, classify="gen")$predictions$pvals
##D   ## gen pred.value std.error est.stat
##D   ## G01     24.59    0.8312  Estimable
##D   ## G02     26.92    0.8312  Estimable
##D   ## G03     32.62    0.8312  Estimable
##D   ## G04     26.97    0.8312  Estimable
##D   ## G05     26.02    0.8312  Estimable
## End(Not run)




