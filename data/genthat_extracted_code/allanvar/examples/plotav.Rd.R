library(allanvar)


### Name: plotav
### Title: Allan Variance plot
### Aliases: plotav
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Load data 
data(gyroz)

#Allan variance computation using avar
avgyroz <- avar(gyroz@.Data, frequency(gyroz))
plotav(avgyroz)



