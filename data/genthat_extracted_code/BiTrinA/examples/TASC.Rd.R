library(BiTrinA)


### Name: TASC
### Title: Trinarization Across Multiple Scales
### Aliases: TASC
### Keywords: trinarization trinarize TASC multiple scales

### ** Examples

par(mfrow=c(2,1))
result <- TASC(iris[,"Petal.Width"], method="A", tau=0.15)
print(result)
plot(result)

result <- TASC(iris[,"Petal.Width"], method="B", tau=0.15)
print(result)
plot(result)



