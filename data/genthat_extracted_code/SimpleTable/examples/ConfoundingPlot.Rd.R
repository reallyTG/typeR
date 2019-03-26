library(SimpleTable)


### Name: ConfoundingPlot
### Title: Confounding Plot of Quinn (2008)
### Aliases: ConfoundingPlot
### Keywords: hplot

### ** Examples

## Example from Quinn (2008)
## (original data from Oliver and Wolfinger. 1999. 
##   ``Jury Aversion and Voter Registration.'' 
##     American Political Science Review. 93: 147-152.)
##
##        Y=0       Y=1
## X=0    19        143
## X=1    114       473
##

C <- 19 + 143 + 114 + 473
theta00 <- 19/C
theta01 <- 143/C
theta10 <- 114/C
theta11 <- 473/C

## may have to adjust size of graphics device to make labels readable
ConfoundingPlot(theta00=theta00, theta01=theta01, 
	        theta10=theta10, theta11=theta11, legend=TRUE)


## same data but with various epsilons and a legend
## may have to adjust size of graphics device to make labels readable
ConfoundingPlot(theta00=theta00, theta01=theta01, 
	        theta10=theta10, theta11=theta11, 
		epsilon=c(.01, .025, .05, .1), 
		color=c("black", "darkblue", "blue", "cyan"), 
		legend=TRUE)

         

## same data but reference distribution is now just within the treated
## may have to adjust size of graphics device to make labels readable
ConfoundingPlot(theta00=theta00, theta01=theta01, 
	        theta10=theta10, theta11=theta11, 
		conditioning="Treated", legend=TRUE)



## set PrY1.setX0 and PrY1.setX1 in order to get a reference
## post-intervention distribution that is consistent with 
## ATE = -0.2 (note there are many ways to do this)
## may have to adjust size of graphics device to make labels readable
ConfoundingPlot(theta00=theta00, theta01=theta01, 
	        theta10=theta10, theta11=theta11, 
		PrY1.setX0=.9, PrY1.setX1=.7,
		legend=TRUE)


## another way to get ATE = -0.2
## may have to adjust size of graphics device to make labels readable
ConfoundingPlot(theta00=theta00, theta01=theta01, 
	        theta10=theta10, theta11=theta11, 
		PrY1.setX0=.85, PrY1.setX1=.65,
		legend=TRUE)


## a way to get ATE = -0.2 that is impossible given the observed data
##  (note the complete lack of any shaded regions in the left panel of plot)
## may have to adjust size of graphics device to make labels readable
ConfoundingPlot(theta00=theta00, theta01=theta01, 
	        theta10=theta10, theta11=theta11, 
		PrY1.setX0=.5, PrY1.setX1=.3,
		legend=TRUE)





