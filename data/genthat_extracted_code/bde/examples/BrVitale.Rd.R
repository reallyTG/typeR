library(bde)


### Name: BrVitale
### Title: Class '"BrVitale"'
### Aliases: BrVitale BrVitale-class
### Keywords: classes

### ** Examples

# create the model 
model <- brVitale(dataPoints = tuna.r, m = 25, M = 25/2)


# examples of usual functions
density(model,0.5)

distribution(model,0.5,discreteApproximation=FALSE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Tuna Data")
lines(model, col="red",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(model,show=TRUE,includePoints=TRUE)



