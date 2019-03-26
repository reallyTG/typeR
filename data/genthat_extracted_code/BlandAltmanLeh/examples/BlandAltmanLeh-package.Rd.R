library(BlandAltmanLeh)


### Name: BlandAltmanLeh-package
### Title: (Slightly extended) Bland-Altman plots BlandAltmanLeh
### Aliases: BlandAltmanLeh-package BlandAltmanLeh
### Keywords: measurement precision, test-retest reliability

### ** Examples

# simple basic Bland Altman plot
a <- rnorm(40,30,10)
b <- 1.01*a + rnorm(40)
bland.altman.plot(a,b, xlab="mean", ylab="difference")

# to get all the data for further analysis
bland.altman.plot(a,b, xlab="mean", ylab="difference", silent=FALSE)

# to include confidence intervals into the plot
bland.altman.plot(a,b, xlab="mean", ylab="difference", conf.int=.95)

# to plot in ggplot2
bland.altman.plot(a,b, graph.sys="ggplot2")

# to mark ties in a Sunflower-Bland-Altman plot
a <- sample(1:5, 40, replace=TRUE)
b <- rep(c(1,2,3,3,5,5,5,5),5)
bland.altman.plot(a, b, sunflower=TRUE)
 



