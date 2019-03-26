library(ESTER)


### Name: seqERboot
### Title: Computes sequential evidence ratios for a given data set and
###   permutation samples
### Aliases: seqERboot

### ** Examples

## Not run: 
##D data(mtcars)
##D mod1 <- lm(mpg ~ cyl, mtcars)
##D mod2 <- lm(mpg ~ cyl + disp, mtcars)
##D seqERboot(ic = bic, mod1, mod2, nmin = 10, order_nb = 20)
## End(Not run)




