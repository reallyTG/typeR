library(DAAG)


### Name: milk
### Title: Milk Sweetness Study
### Aliases: milk
### Keywords: datasets

### ** Examples

print("Rug Plot - Example 1.8.1")
xyrange <- range(milk)
plot(four ~ one, data = milk, xlim = xyrange, ylim = xyrange, pch = 16)
rug(milk$one)
rug(milk$four, side = 2)
abline(0, 1)



