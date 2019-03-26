library(gsubfn)


### Name: fn
### Title: Transform formula arguments to functions.
### Aliases: fn $.fn eval.with.vis matrixfn
### Keywords: programming

### ** Examples


   # use of formula to specify a function.
   # Note that LETTERS, letters and pi are automatically excluded from args
   fn$lapply(list(1:4, 1:3), ~ LETTERS[x])
   fn$sapply(1:3, ~ sin((n-1) * pi/180))

   # use of simplify = rbind instead of do.call(rbind, by(...)).
   # args to anonymous function are automatically determined.
   fn$by(BOD, 1:nrow(BOD), ~ c(mn = min(x), mx = max(x)), simplify = rbind)

   # calculate lm coefs of uptake vs conc for each Plant
   fn$by(CO2, CO2$Plant, d ~ coef(lm(uptake ~ conc, d)), simplify = rbind)

   # mid range of conc and uptake by Plant
   fn$aggregate(CO2[,4:5], CO2[1], ~ mean(range(x)))

   # string interpolation
   j <- fn$cat("pi = $pi, exp = `exp(1)`\n")

## Not run: 
##D 
##D    # same but use cast/melt from reshape package
##D    library(reshape)
##D    fn$cast(Plant ~ variable, data = melt(CO2, id = 1:3), ~~ mean(range(x)))
##D 
##D    # same
##D    # uncomment when new version of doBy comes out (expected shortly)
##D    # library(doBy)
##D    # fn$summaryBy(.~Plant,CO2[-(2:3)],FUN= ~~mean(range(x)), pref='midrange')
## End(Not run)

   # generalized matrix product
   # can replace sum(x*y) with any other inner product of interest
   # this example just performs matrix multiplication of a times b
   a <- matrix(4:1, 2)
   b <- matrix(1:4, 2)
   fn$apply(b, 2, x ~ fn$apply(a, 1, y ~ sum(x*y)))

   # integration
   fn$integrate(~1/((x+1)*sqrt(x)), lower = 0, upper = Inf)

   # optimization
   fn$optimize(~ x^2, c(-1,1))

   # using fn with S4 definitions
   setClass('ooc', representation(a = 'numeric'))
   fn$setGeneric('incr', x + value ~ standardGeneric('incr'))
   fn$setMethod('incr', 'ooc', x + value ~ {x@a <- x@a+value; x})
   oo <- new('ooc',a=1)
   oo <- incr(oo,1)
   oo

## Not run: 
##D 
##D    # plot quantile regression fits for various values of tau
##D    library(quantreg)
##D    data(engel)
##D    plot(engel$x, engel$y, xlab = 'income', ylab = 'food expenditure')
##D    junk <- fn$lapply(1:9/10, tau ~ abline(coef(rq(y ~ x, tau, engel))))
##D 
##D    # rolling mid-range
##D    library(zoo)
##D    fn$rollapply(LakeHuron, 12, ~ mean(range(x)))
##D 
##D    library(lattice)
##D    fn$xyplot(uptake ~ conc | Plant, CO2,
##D       panel = ... ~ { panel.xyplot(...); panel.text(200, 40, lab = 'X') })
##D 
##D    library(boot)
##D    set.seed(1)
##D    fn$boot(rivers, ~ median(x, d), R = 2000)
## End(Not run)

   x <- 0:50/50
   matplot(x, fn$outer(x, 1:8, ~ sin(x * k*pi)), type = 'blobcsSh')





