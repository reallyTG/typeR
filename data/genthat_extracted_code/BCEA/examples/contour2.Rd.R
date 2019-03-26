library(BCEA)


### Name: contour2
### Title: Specialised contour plot for objects in the class "bcea"
### Aliases: contour2
### Keywords: Health economic evaluation Bayesian model

### ** Examples

### create the bcea object m for the smoking cessation example
data(Smoking)
m=bcea(e,c,ref=4,interventions=treats,Kmax=500)
### produce the plot
contour2(m,wtp=200,graph="base")
## No test: 
### or use ggplot2 to plot multiple comparisons
contour2(m,wtp=200,ICER.size=2,graph="ggplot2")
## End(No test)



