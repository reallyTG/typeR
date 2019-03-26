library(intrinsicDimension)


### Name: dancoDimEst
### Title: Dimension Estimation With the DANCo and MIND Methods
### Aliases: dancoDimEst

### ** Examples

data <- hyperBall(50, 10)
res <- dancoDimEst(data, 8, 20)
print(res)

## Reusing calibration data
data2 <- hyperBall(50, 5)
dancoDimEst(data2, 8, 20, calibration.data=res$calibration.data)



