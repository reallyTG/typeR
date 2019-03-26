library(fastR2)


### Name: SSplot
### Title: Sum of Squares Plots
### Aliases: SSplot

### ** Examples

  
SSplot(
  lm(strength ~ limestone + water, data = Concrete),
  lm(strength ~ limestone + rand(7), data = Concrete),
  n = 50) 
## Not run: 
##D SSplot(
##D   lm(strength ~ water + limestone, data = Concrete),
##D   lm(strength ~ water + rand(7), data = Concrete),
##D   n = 1000) 
## End(Not run)



