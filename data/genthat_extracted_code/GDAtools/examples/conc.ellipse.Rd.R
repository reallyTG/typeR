library(GDAtools)


### Name: conc.ellipse
### Title: Adds concentration ellipses to a correspondence analysis graph.
### Aliases: conc.ellipse
### Keywords: aplot multivariate misc

### ** Examples

## Performs specific MCA (excluding 'NA' categories) of 'Taste' example data set,
## plots the cloud of categories
## and adds concentration ellipses for gender variable
data(Taste)
mca <- speMCA(Taste[,1:11],excl=c(3,6,9,12,15,18,21,24,27,30,33))
plot(mca,type='i')
conc.ellipse(mca,Taste$Gender)

## Draws a blue concentration ellipse for men only
plot(mca,type='i')
conc.ellipse(mca,Taste$Gender,sel=1,col='blue')



