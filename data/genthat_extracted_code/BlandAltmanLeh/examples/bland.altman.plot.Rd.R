library(BlandAltmanLeh)


### Name: bland.altman.plot
### Title: Produce Bland-Altman Plot Bland-AltmanPlots for assessing
###   agreement between two measuring methods or repeatability (test-retest
###   agreement) of measurements. Using either base graphics or ggplot2.
### Aliases: bland.altman.plot

### ** Examples

bland.altman.plot(rnorm(20), rnorm(20), xlab="mean measurement", 
                  ylab="differences", main="Example plot")
                  
bland.altman.plot(rnorm(20), 2+.8*rnorm(20), xlab="mean measurement", 
                  ylab="differences", conf.int=.95)
                  
bland.altman.plot(rnorm(200), 2+.8*rnorm(200), xlab="mean measurement", 
                  ylab="differences", conf.int=.95)
                  
# this is what fig.2 in Bland&Altman1986 would have looked like
PEFR1 <- bland.altman.PEFR[,1]
PEFR2 <- bland.altman.PEFR[,3]
bland.altman.plot(PEFR1, PEFR2, silent=TRUE, xlim=c(0,800),
                  xlab="Average PEFR by two meters",
                  ylab="Difference in PEFR (large-mini)")

# and this is the same but with additional 95 percent CIs
data(bland.altman.PEFR)
bland.altman.plot(PEFR1, PEFR2, silent=TRUE, conf.int=.95, xlim=c(0,800))
                  
# an example with many ties and the 'sunflower'-option
a <- rep(c(1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,5,6,6),2)
b <- rep(c(1,1,1,2,2,2,3,1,4,2,5,3,3,3,3,3),3)
bland.altman.plot(a,b,sunflower=TRUE, xlab="Mean",ylab="Difference",
                  main="discrete values lead to ties")
                  
library(ggplot2)
a <- bland.altman.plot(rnorm(20), rnorm(20), graph.sys="ggplot2", conf.int=.9)
print(a + xlab("you can change this later") + ggtitle("Title goes here"))                  



