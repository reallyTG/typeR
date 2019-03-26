library(LPTime)


### Name: LPTrans
### Title: This function computes m specially-designed LP orthonormal basis
###   functions of a random variable
### Aliases: LPTrans
### Keywords: nonparametric ts algebra

### ** Examples

library(lattice)
#Example from Eye Trajectory data
data(EyeTrack.sample)
x.coords <- EyeTrack.sample[,1]

x.diff <- diff(x.coords) #Differenced x-coordinate series
trans.x.diff <- LPTrans(x.diff, m = 4)
head(trans.x.diff)

x.diff.std <- (x.diff - mean(x.diff))/sd(x.diff)

x.series <- cbind(x.diff.std, ts(LPTrans(x.diff, m = 4)))
colnames(x.series) <- c("Difference of X",paste("LPTrans(diff(X)) [,",1:4,"]", sep = ""))
xyplot(x.series,outer = TRUE,
       main = "Plot of differenced x-coordinates
and its LP-transformations over time"
       )



