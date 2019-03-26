library(VLMC)


### Name: logLik
### Title: Log Likelihood of and between VLMC objects
### Aliases: logLik.vlmc entropy entropy2
### Keywords: ts models

### ** Examples

dd <- cumsum(rpois(999, 1.5)) %% 10
(vd <- vlmc(dd))
entropy(vd)# the bare number
logLik(vd)
logLik(vdL <- vlmc(dd, cutoff = 3))
entropy2(vd $vlmc.vec,
         vdL$vlmc.vec)

## AIC model selection:
f1 <- c(1,0,0,0)  # as in example(vlmc)
f2 <- rep(1:0,2)
(dt1 <- c(f1,f1,f2,f1,f2,f2,f1))
AIC(print(vlmc(dt1)))
AIC(print(vlmc(dt1, cutoff = 2.6)))
AIC(print(vlmc(dt1, cutoff = 0.4)))# these two differ ``not really''
AIC(print(vlmc(dt1, cutoff = 0.1)))

## Show how to compute it from the fitted conditional probabilities :
logLikR <- function(x) {
    dn <- dimnames(pr <- predict(x))
    sum(log(pr[cbind(2:nrow(pr), match(dn[[1]][-1], dn[[2]]))]))
}

all.equal(  logLikR(vd),
          c(logLik (vd)), tol=1e-10) # TRUE, they do the same

## Compare different ones:  [cheap example]:
example(draw)
for(n in ls())
  if(is.vlmc(get(n))) {
       vv <- get(n)
       cat(n,":",formatC(logLik(vv) / log(vv$alpha.len),
                         format= "f", wid=10),"\n")
  }



