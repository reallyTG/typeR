library(strucchange)


### Name: boundary.mefp
### Title: Boundary Function for Monitoring of Structural Changes
### Aliases: boundary.mefp
### Keywords: regression

### ** Examples

df1 <- data.frame(y=rnorm(300))
df1[150:300,"y"] <- df1[150:300,"y"]+1
me1 <- mefp(y~1, data=df1[1:50,,drop=FALSE], type="ME", h=1,
              alpha=0.05)
me2 <- monitor(me1, data=df1)

plot(me2, boundary=FALSE)
lines(boundary(me2), col="green", lty="44")



