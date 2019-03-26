library(strucchange)


### Name: plot.mefp
### Title: Plot Methods for mefp Objects
### Aliases: plot.mefp lines.mefp
### Keywords: hplot

### ** Examples

df1 <- data.frame(y=rnorm(300))
df1[150:300,"y"] <- df1[150:300,"y"]+1
me1 <- mefp(y~1, data=df1[1:50,,drop=FALSE], type="ME", h=1,
              alpha=0.05)
me2 <- monitor(me1, data=df1)

plot(me2)



