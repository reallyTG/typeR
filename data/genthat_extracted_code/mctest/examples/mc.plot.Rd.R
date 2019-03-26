library(mctest)


### Name: mc.plot
### Title: Plot of VIF and Eigenvalues
### Aliases: mc.plot
### Keywords: VIF Eigenvalues

### ** Examples

## Hald Cement data
data(Hald)
x<-Hald[,-1]
y<-Hald[,1]

## plot with default threshold of VIF and Eigenvalues with no intercept
mc.plot(x, y)

## plot with default threshold of VIF and Eigenvalues with intercept
mc.plot(x, y, Inter = TRUE)

## plot with specific threshold of VIF and Eigenvalues with no intercept
mc.plot(x, y, vif = 5, ev = 20)

## plot with specific threshold of VIF and Eigenvalues with intercept
mc.plot(x, y, vif = 5, ev = 20, Inter = TRUE)



