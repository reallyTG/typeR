library(BenfordTests)


### Name: signifd.analysis
### Title: Graphical Analysis of First Significant Digits
### Aliases: signifd.analysis
### Keywords: hplot

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Analyze the first digits using the the defaults
signifd.analysis(X)
#Turn off plot
signifd.analysis(X,graphical_analysis=FALSE)
#Use absolute frequencies
signifd.analysis(X,graphical_analysis=FALSE,freq=TRUE)
#Use five evenly spaced confidence intervals, no lines
#alphas is used for shadeing
signifd.analysis(X,graphical_analysis=TRUE,alphas=5,freq=TRUE,ci_lines=FALSE)
#Use fifty evenly spaced, gray confidence intervals, blue ticks, and lines at 
#the 1 and 5 percent confidence intervals
signifd.analysis(X,graphical_analysis=TRUE,alphas=50,freq=TRUE,tick_col="blue",
ci_col="gray",ci_lines=c(.01,.05))



