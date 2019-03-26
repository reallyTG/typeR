library(tfse)


### Name: rescale
### Title: Standard: Rescale values to a standard normal scale
### Aliases: rescale rescale_standard rescale_normal rescale_log
###   rescale_pointscale

### ** Examples

## randomly sample 10 values ranging from -10 to 100
x <- sample(-10:100, 10)

## rescale to 0-1 scale
rescale_standard(x)

## rescale to normal distribution (z-scores)
rescale_normal(x)

## rescale to logged distribution (natural log)
rescale_log(x)

## rescale to new point scale
rescale_pointscale(x, 1, 7, lower0 = -10, upper0 = 100)




