library(Binarize)


### Name: binarize.BASC
### Title: Binarization Across Multiple Scales
### Aliases: binarize.BASC
### Keywords: binarization binarize BASC multiple scales

### ** Examples

par(mfrow=c(2,1))
result <- binarize.BASC(iris[,"Petal.Length"], method="A", tau=0.15)
print(result)
plot(result)

result <- binarize.BASC(iris[,"Petal.Length"], method="B", tau=0.15)
print(result)
plot(result)



