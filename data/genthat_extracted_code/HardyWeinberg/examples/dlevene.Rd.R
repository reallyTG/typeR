library(HardyWeinberg)


### Name: dlevene
### Title: Calculate Levene's exact density for k alleles
### Aliases: dlevene
### Keywords: distribution

### ** Examples

x <- c(AA=12,AB=19,AC=13,BB=7,BC=5,CC=0)
x <- toTriangular(x)
prob <- dlevene(x)
print(prob)



