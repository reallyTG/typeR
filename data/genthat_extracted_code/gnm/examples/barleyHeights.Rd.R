library(gnm)


### Name: barleyHeights
### Title: Heights of Barley Plants
### Aliases: barleyHeights
### Keywords: datasets

### ** Examples

set.seed(1)
## Fit AMMI-1 model
barleyModel <- gnm(height ~ year + genotype + Mult(year, genotype),
                   data = barleyHeights)

## Get row and column scores with se's
gamma <- getContrasts(barleyModel, pickCoef(barleyModel, "[.]y"),
                      ref = "mean", scaleWeights = "unit")
delta <- getContrasts(barleyModel, pickCoef(barleyModel, "[.]g"),
                      ref = "mean", scaleWeights = "unit")

## Corresponding CI's similar to Chadoeuf & Denis (1991) Table 8
## (allowing for change in sign)
gamma[[2]][,1] + (gamma[[2]][,2]) %o% c(-1.96, 1.96)
delta[[2]][,1] + (delta[[2]][,2]) %o% c(-1.96, 1.96)

## Multiplier of row and column scores
height <- matrix(scale(barleyHeights$height, scale = FALSE), 15, 9)
R <- height - outer(rowMeans(height), colMeans(height), "+")
svd(R)$d[1]



