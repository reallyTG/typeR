library(approximator)


### Name: object
### Title: Optimization of posterior likelihood of hyperparameters
### Aliases: object opt.1 opt.gt.1
### Keywords: array

### ** Examples

data(toyapps)
object(level=4, D=D1.toy , z=z.toy,basis=basis.toy,
   subsets=subsets.toy, hpa=hpa.fun.toy(1:19))
object(level=4, D=D1.toy , z=z.toy,basis=basis.toy,
   subsets=subsets.toy, hpa=hpa.fun.toy(3+(1:19)))


# Now a little example of finding optimal hyperpameters in the toy case
# (a bigger example is given on the genie help page)
jj <- list(trace=100,maxit=10)

hpa.toy.level1 <- opt.1(D=D1.toy, z=z.toy, basis=basis.toy,
          subsets=subsets.toy, hpa.start=hpa.toy,control=jj)

hpa.toy.level2 <- opt.gt.1(level=2, D=D1.toy, z=z.toy,
           basis=basis.toy, subsets=subsets.toy,
           hpa.start=hpa.toy.level1, control=jj)

hpa.toy.level3 <- opt.gt.1(level=3, D=D1.toy, z=z.toy,
           basis=basis.toy, subsets=subsets.toy,
           hpa.start=hpa.toy.level2, control=jj) 

hpa.toy.level4 <- opt.gt.1(level=4, D=D1.toy, z=z.toy,
           basis=basis.toy, subsets=subsets.toy,
           hpa.start=hpa.toy.level3, control=jj)




