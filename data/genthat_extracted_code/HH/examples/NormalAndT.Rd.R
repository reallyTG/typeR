library(HH)


### Name: NTplot
### Title: Specify plots to illustrate Normal and t Hypothesis Tests or
###   Confidence Intervals, including normal approximation to the binomial.
### Aliases: NTplot NTplot.default NTplot.htest NTplot.power.htest
###   NTplot.NormalAndTplot
### Keywords: hplot shiny

### ** Examples

x1 <- rnorm(12)
x2 <- rnorm(12, mean=.5)

NT.object <- NTplot(mean0=0, mean1=1)
NT.object
attr(NT.object, "scales")
attr(NT.object, "prob")
cat(attr(NT.object, "call"), "\n") ## the cat() is needed to unescape embedded quotes.

NTplot(t.test(x1, x2))
NTplot(power.t.test(power = .90, delta = 1, alternative = "one.sided"))

## Not run: 
##D ## 22 distinct calls are shown in
##D demo(NTplot, ask=FALSE)
## End(Not run)

## Not run: 
##D  ## these are interactive and do not work in static checking of the code
##D NTplot(mean0=0, mean1=1, shiny=TRUE)
##D NTplot(shiny=TRUE, px.height=475) ## default value is 575
##D NTplot(t.test(x1, x2), shiny=TRUE, mean1=1)
##D NTplot(power.t.test(power = .90, delta = 1, alternative = "one.sided"), shiny=TRUE)
##D NTplot(NT.object, shiny=TRUE)
##D 
##D ## run the shiny app
##D shiny::runApp(system.file("shiny/NTplot", package="HH"))
## End(Not run)




