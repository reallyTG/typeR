library(distr)


### Name: plot-methods
### Title: Methods for Function plot in Package 'distr'
### Aliases: plot plot-methods
###   plot,AffLinUnivarLebDecDistribution,missing-method
###   plot,UnivarLebDecDistribution,missing-method
###   plot,AbscontDistribution,missing-method
###   plot,DiscreteDistribution,missing-method
###   plot,CompoundDistribution,missing-method
###   plot,DistrList,missing-method
### Keywords: methods hplot distribution

### ** Examples

plot(Binom(size = 4, prob = 0.3))
plot(Binom(size = 4, prob = 0.3), do.points = FALSE)
plot(Binom(size = 4, prob = 0.3), verticals = FALSE)
plot(Binom(size = 4, prob = 0.3), main = TRUE)
plot(Binom(size = 4, prob = 0.3), main = FALSE)
plot(Binom(size = 4, prob = 0.3), cex.points = 1.2, pch = 20)
plot(Binom(size = 4, prob = 0.3), xlab = list("a1","a2", "a3"),
           ylab=list("p"="U","q"="V","d"="W"))
B <- Binom(size = 4, prob = 0.3)
plot(B, col = "red", col.points = "green", main = TRUE, col.main = "blue", 
     col.sub = "orange", sub = TRUE, cex.sub = 0.6, col.inner = "brown")
plot(Nbinom(size = 4,prob = 0.3), cex.points = 1.2, col = "red", 
     col.points = "green")
plot(Nbinom(size = 4,prob = 0.3), cex.points = 1.2, pch.u = 20, pch.a = 10)
plot(Norm(), main = TRUE, cex.main = 3, tmar = 6)
plot(Norm(), inner = FALSE, main = TRUE, cex.main = 3, tmar = 6)
plot(Norm(), lwd = 3, col = "red", ngrid = 200, lty = 3, las = 2)
plot(Norm(), main = "my Distribution: %A", 
     inner = list(expression(paste(lambda,"-density of %C(%P)")), "CDF",
                  "Pseudo-inverse with param's %N"), 
     sub = "this plot was correctly generated on %D", 
     cex.inner = 0.9, cex.sub = 0.8)

plot(Norm(),panel.first=grid(4,4))
## does not (yet) work as desired:
plot(Norm(),panel.first=list(grid(5,5),grid(3,3),grid(4,4)))
li <- list(substitute(grid(5,5)),substitute(grid(3,3)),substitute(grid(4,4)))
plot(Norm(),panel.first=li)

plot(Cauchy())
plot(Cauchy(), xlim = c(-4,4))
plot(Chisq())
### the next ylab argument is just for illustration purposes
plot(Chisq(),mfColRow = FALSE,to.draw.arg="d",
     xlab="x",ylab=list(expression(paste(lambda,"-density of %C(%P)"))))
## substitution can be switched off
plot(Chisq(),mfColRow = FALSE,to.draw.arg="d",
     xlab="x",ylab=list(expression(paste(lambda,"-density of %C(%P)"))), withSubst=FALSE)
plot(Chisq(), log = "xy", ngrid = 100)
Ch <- Chisq(); setgaps(Ch); plot(Ch, do.points = FALSE)
setgaps(Ch, exactq = 3); plot(Ch, verticals = FALSE)
plot(Ch, cex = 1.2, pch.u = 20, pch.a = 10, col.points = "green", 
     col.vert = "red")

## some distribution with gaps
wg <- flat.mix(UnivarMixingDistribution(Unif(0,1),Unif(4,5), 
               withSimplify=FALSE))
# some Lebesgue decomposed distribution 
mymix <- UnivarLebDecDistribution(acPart = wg, discretePart = Binom(4,.4),
         acWeight = 0.4)
plot(mymix)         
#
## selection of subpanels for plotting
N <- Norm()
par(mfrow=c(1,2))
plot(N, mfColRow = FALSE, to.draw.arg=c("d","q"))
plot(N, mfColRow = FALSE, to.draw.arg=c(2,3))
par(mfrow=c(1,1))

wg <- flat.mix(UnivarMixingDistribution(Unif(0,1),Unif(4,5),
               withSimplify=FALSE))
myLC <- UnivarLebDecDistribution(discretePart=Binom(3,.3), acPart = wg,
          discreteWeight=.2)
layout(matrix(c(rep(1,6),2,2,3,3,4,4,5,5,5,6,6,6), 
              nrow=3, byrow=TRUE))
plot(myLC,mfColRow = FALSE,
     to.draw.arg=c("p","d.c","p.c","q.c", "p.d","q.d"))

P <- Pois(2)
plot(as(P,"UnivarLebDecDistribution"),mfColRow = FALSE,to.draw.arg=c("d.d"))
### the next ylab argument is just for illustration purposes
plot(as(P,"UnivarLebDecDistribution"),mfColRow = FALSE,to.draw.arg=c("d.d"),
     xlab="x",ylab=list(expression(paste(lambda,"-density of %C(%P)"))))




