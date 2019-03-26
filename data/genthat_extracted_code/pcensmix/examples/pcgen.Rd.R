library(pcensmix)


### Name: pcgen
### Title: Creating a Progressively Type-II Censored Version of a Given
###   Dataset
### Aliases: pcgen

### ** Examples

## 1. Generate a progressive Type-II censored data from a simulated mixture data with
## allowing for censoring with controlling parameters p = 0.3 and r = 12.
set.seed(0)
mixture <- mixgen(N = 20, dist1 = 'norm', dist2 = 'weibull', control = list(12, 2, 15, 4, 0.3))
Pdat0 <- pcgen(r = 12, p = 0.3, data = mixture)
print(Pdat0)


## 2. Examples of generating a progresively Type-II censored data

set.seed(0)
Pdat1 <- pcgen(r = 6, p = 0.3, data = insulate)
print(Pdat1)

set.seed(100)
Pdat2 <- pcgen(r = 260, p = 0.35, data = blood$Systolic.BP)
print(Pdat2)





