library(dispRity)


### Name: extract.dispRity
### Title: Extracting disparity values.
### Aliases: extract.dispRity

### ** Examples

## Load the disparity data based on Beck & Lee 2014
data(disparity)

## Extracting the observed disparity
extract.dispRity(disparity)

## Extracting the bootstrapped disparity
boot_disp <- extract.dispRity(disparity, observed = FALSE)
str(boot_disp)
## Or only the rarefied (5) data
boot_disp_rare <- extract.dispRity(disparity, observed = FALSE,
     rarefaction = 5)




