library(nsgp)


### Name: gpr1sample
### Title: Perform one-sample GP regression
### Aliases: gpr1sample

### ** Examples

# load example data
data(toydata)

## Not run: 
##D can take sevaral minutes
##D  # perform gpr
##D  res = gpr1sample(toydata$ctrl$x, toydata$ctrl$y, seq(0,22,0.1))
##D  print(res)
## End(Not run)

# pre-computed toydata model
data(toygps)
print(toygps$ctrlmodel)



