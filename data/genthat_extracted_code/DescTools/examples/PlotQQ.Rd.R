library(DescTools)


### Name: PlotQQ
### Title: QQ-Plot for Any Distribution
### Aliases: PlotQQ
### Keywords: univar hplot

### ** Examples

y <- rexp(100, 1/10)
PlotQQ(y, function(p) qexp(p, rate=1/10))

w <- rweibull(100, shape=2)
PlotQQ(w, qdist = function(p) qweibull(p, shape=4))

z <- rchisq(100, df=5)
PlotQQ(z, function(p) qchisq(p, df=5),
       args.qqline=list(col=2, probs=c(0.1, 0.6)),
       main=expression("Q-Q plot for" ~~ {chi^2}[nu == 3]))
abline(0,1)

# add 5 random sets
for(i in 1:5){
  z <- rchisq(100, df=5)
  PlotQQ(z, function(p) qchisq(p, df=5), add=TRUE, args.qqline = NA,
         col="grey", lty="dotted")
}



