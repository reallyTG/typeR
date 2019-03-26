library(primer)


### Name: chesson
### Title: Two-species model of the storage effect
### Aliases: chesson
### Keywords: methods

### ** Examples

out <- chesson(years=50)
layout(matrix(1:4, nc=2))
matplot(out[["time"]], out[["Ns"]], type='l', lty=c(1:3),
        xlab="Time", ylab="N", log="y")
plot(out[["time"]][-1], out[["env"]], type='l',
     xlab="Time", ylab="Environment")
matplot(out[["env"]], out[["Es"]], xlab="Environment",
 ylab="Density-independent reproduction")
matplot(out[["env"]], out[["Rs"]], xlab="Environment",
 ylab="Annual growth rate")




