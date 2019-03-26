library(DescTools)


### Name: Median
### Title: (Weighted) Median Value
### Aliases: Median Median.Freq Median.factor Median.default
### Keywords: univar robust

### ** Examples

Median(1:4)                # = 2.5 [even number]
Median(c(1:3, 100, 1000))  # = 3 [odd, robust]

# Approximation for classified data
breaks <- seq(10,70, 10)
Median(
  Freq(cut(d.pizza$temperature, breaks=breaks)),
  breaks=breaks)

# compared to
Median(d.pizza$temperature)



