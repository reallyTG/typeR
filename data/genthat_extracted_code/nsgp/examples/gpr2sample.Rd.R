library(nsgp)


### Name: gpr2sample
### Title: Performs two-sample GP regression
### Aliases: gpr2sample

### ** Examples

# read toy data
data(toydata)

## Not run: 
##D can take several minutes
##D  # perform two-sample regression
##D  res = gpr2sample(toydata$ctrl$x, toydata$ctrl$y, toydata$case$x, toydata$case$y, seq(0,22,0.1))
##D  print(res)
## End(Not run)

# pre-computed model for toydata
data(toygps)
print(toygps)



