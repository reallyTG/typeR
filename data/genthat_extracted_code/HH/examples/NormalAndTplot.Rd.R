library(HH)


### Name: NormalAndTplot
### Title: Specify plots to illustrate Normal and t Hypothesis Tests or
###   Confidence Intervals.
### Aliases: NormalAndTplot NormalAndTplot.default NormalAndTplot.htest
### Keywords: hplot

### ** Examples

   NTplot(mean0=0, mean1=2,  xbar=1.8,  xlim=c(-3, 5))
   NTplot(mean0=0, mean1=2,  xbar=1.8,  xlim=c(-3, 5), distribution.name="t", df=4)
   NTplot(mean0=100, sd=12, mean1=113,  xbar=105,  xlim=c(92, 120), n=20)
   NTplot(mean0=100, sd=12, mean1=113,  xbar=105,  xlim=c(92, 120), n=20,
          zaxis=TRUE, z1axis=TRUE)
   NTplot(mean0=100, sd=12,  xbar=105,  xlim=c(92, 108), n=20, ntcolors="stoplight")
   NTplot(xbar=95, sd=10, xlim=c(65, 125), type="confidence",
          alpha.left=.025, alpha.right=.025)


x <- rnorm(12, mean=.78)
x.t <- t.test(x)
NTplot(x.t)
NTplot(x.t, type="confidence")
x.tg <- t.test(x, alternative="greater")
NTplot(x.tg)

y <- rnorm(12, mean=-.05)
xy.t <- t.test(x, y)
NTplot(xy.t)
NTplot(xy.t, type="confidence")

## Not run: 
##D      NTplot(shiny=TRUE)  ## with any other arguments for initialization of the shiny app.
## End(Not run)

## Not run: 
##D    ##  The partially transparent colors are:
##D    black127="#0000007F" ## HH:::ColorWithAlpha("black")
##D    green127="#00FF007F" ## HH:::ColorWithAlpha("green")
##D    blue127 ="#0000FF7F" ## HH:::ColorWithAlpha("blue")
##D 
##D 
##D ## this is the default set of colors that are assigned when
##D ## ntcolors="original" or when ntcolors is not specified
##D c(col.alpha = "blue",
##D   col.notalpha = "lightblue",
##D   col.beta = "red",
##D   col.power = "pink",
##D   col.pvalue = "green",
##D   col.pvaluetranslucent = green127,
##D   col.critical = "gray50",
##D   col.border = black127,
##D   col.text = "black",
##D   col.conf = "lightgreen")
##D 
##D   NTplot(                 )
##D   NTplot(mean1 = 2,       )
##D   NTplot(           xbar=1)
##D   NTplot(mean1 = 2, xbar=1)
##D   NTplot(type="confidence")
##D 
##D 
##D ## this is the set of colors that are assigned when ntcolors="stoplight"
##D c(col.alpha = "red",
##D   col.notalpha = "honeydew2",
##D   col.beta = "orange",
##D   col.power = "pink",
##D   col.pvalue = "blue",
##D   col.pvaluetranslucent = blue127,
##D   col.critical = "gray50",
##D   col.border = black127,
##D   col.text = "black",
##D   col.conf = "lightgreen")
##D 
##D   NTplot(                   ntcolors="stoplight")
##D   NTplot(mean1 = 2,         ntcolors="stoplight")
##D   NTplot(           xbar=1, ntcolors="stoplight")
##D   NTplot(mean1 = 2, xbar=1, ntcolors="stoplight")
##D   NTplot(type="confidence", ntcolors="stoplight")
##D 
##D ## this is the set of colors that are assigned when ntcolors="BW"
##D c(col.alpha             = "gray35",
##D   col.notalpha          = "gray85",
##D   col.beta              = "gray15",
##D   col.power             = "gray40",
##D   col.pvalue            = "gray50",
##D   col.pvaluetranslucent = HH:::ColorWithAlpha("gray65"),
##D   col.critical          = "gray15",
##D   col.border            = "gray75",
##D   col.text              = "black",
##D   col.conf              = "gray45")
##D 
##D   NTplot(                   ntcolors="BW")
##D   NTplot(mean1 = 2,         ntcolors="BW")
##D   NTplot(           xbar=1, ntcolors="BW")
##D   NTplot(mean1 = 2, xbar=1, ntcolors="BW")
##D   NTplot(type="confidence", ntcolors="BW")
##D 
## End(Not run)

## Not run: 
##D ## mean1 and xbar
##D   NTplot(mean0=0, mean1=2,  xbar=1.8,  xlim=c(-3, 5))
##D   NTplot(mean0=0, mean1=-2, xbar=-1.8, xlim=c(-5, 3),
##D          alpha.left=.05,  alpha.right=0)
##D   NTplot(mean0=0, mean1=2,  xbar=2.1,  xlim=c(-3, 5),
##D          alpha.left=.025, alpha.right=.025)
##D   NTplot(mean0=0, mean1=-2, xbar=-2.1, xlim=c(-5, 3),
##D          alpha.left=.025, alpha.right=.025)
##D 
##D ## mean1
##D   NTplot(mean0=0, mean1=2,  xbar=NA, xlim=c(-3, 5))
##D   NTplot(mean0=0, mean1=-2, xbar=NA, xlim=c(-5, 3),
##D          alpha.left=.05,  alpha.right=0)
##D   NTplot(mean0=0, mean1=2,  xbar=NA, xlim=c(-3, 5),
##D          alpha.left=.025, alpha.right=.025)
##D   NTplot(mean0=0, mean1=-2, xbar=NA, xlim=c(-5, 3),
##D          alpha.left=.025, alpha.right=.025)
##D 
##D ## xbar
##D   NTplot(mean0=0, mean1=NA, xbar=1.8,  xlim=c(-3, 5))
##D   NTplot(mean0=0, mean1=NA, xbar=-1.8, xlim=c(-5, 3),
##D          alpha.left=.05,  alpha.right=0)
##D   NTplot(mean0=0, mean1=NA, xbar=2.1,  xlim=c(-3, 5),
##D          alpha.left=.025, alpha.right=.025)
##D   NTplot(mean0=0, mean1=NA, xbar=-2.1, xlim=c(-5, 3),
##D          alpha.left=.025, alpha.right=.025)
##D 
##D ## t distribution
##D ## mean1 and xbar
##D   NTplot(mean0=0, mean1=2,  xbar=1.8,  xlim=c(-3, 5),
##D          distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=-2, xbar=-1.8, xlim=c(-5, 3),
##D          alpha.left=.05,  alpha.right=0, distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=2,  xbar=2.1,  xlim=c(-3, 5),
##D          alpha.left=.025, alpha.right=.025, distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=-2, xbar=-2.1, xlim=c(-5, 3),
##D          alpha.left=.025, alpha.right=.025, distribution.name="t", df=4)
##D 
##D ## mean1
##D   NTplot(mean0=0, mean1=2,  xbar=NA, xlim=c(-3, 5),
##D          distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=-2, xbar=NA, xlim=c(-5, 3),
##D          alpha.left=.05,  alpha.right=0, distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=2,  xbar=NA, xlim=c(-3, 5),
##D          alpha.left=.025, alpha.right=.025, distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=-2, xbar=NA, xlim=c(-5, 3),
##D          alpha.left=.025, alpha.right=.025, distribution.name="t", df=4)
##D 
##D ## xbar
##D   NTplot(mean0=0, mean1=NA, xbar=1.8,  xlim=c(-3, 5),
##D          distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=NA, xbar=-1.8, xlim=c(-5, 3),
##D          alpha.left=.05,  alpha.right=0, distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=NA, xbar=2.1,  xlim=c(-3, 5),
##D          alpha.left=.025, alpha.right=.025, distribution.name="t", df=4)
##D   NTplot(mean0=0, mean1=NA, xbar=-2.1, xlim=c(-5, 3),
##D          alpha.left=.025, alpha.right=.025, distribution.name="t", df=4)
##D 
##D ## confidence intervals
##D 
##D   NTplot(mean0=0, xlim=c(-3, 4), type="confidence")
##D   NTplot(xbar=01, xlim=c(-3, 4), type="confidence")
##D   NTplot(mean0=0, xlim=c(-4, 3), type="confidence",
##D          alpha.left=.05,  alpha.right=0)
##D   NTplot(mean0=0, xlim=c(-3, 3), type="confidence",
##D          alpha.left=.025, alpha.right=.025)
##D   NTplot(mean0=95, sd=10, xlim=c(65, 125), type="confidence",
##D          alpha.left=.025, alpha.right=.025)
##D   NTplot(mean0=95, sd=10, xlim=c(65, 125), type="confidence",
##D          alpha.left=.025, alpha.right=.025,
##D          distribution="t", df=10)
##D 
## End(Not run)



