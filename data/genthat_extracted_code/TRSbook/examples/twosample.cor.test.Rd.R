library(TRSbook)


### Name: twosample.cor.test
### Title: Comparing statistically two correlation coefficients
### Aliases: twosample.cor.test

### ** Examples

data(BMI.CHILD)
attach(BMI.CHILD)
indf <- which(GENDER=="F")  # To  retrieve indices of the females.
indm <- which(GENDER=="M")  # To retrieve indices of the males.
twosample.cor.test(height[indf],weight[indf],
                   height[indm],weight[indm])
detach(BMI.CHILD)



