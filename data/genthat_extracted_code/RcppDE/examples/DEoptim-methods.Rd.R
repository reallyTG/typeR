library(RcppDE)


### Name: DEoptim-methods
### Title: DEoptim-methods
### Aliases: DEoptim-methods plot.DEoptim summary.DEoptim
### Keywords: methods

### ** Examples

  ## Rosenbrock Banana function
  ## The function has a global minimum f(x) = 0 at the point (0,0).  
  ## Note that the vector of parameters to be optimized must be the first 
  ## argument of the objective function passed to DEoptim.
  Rosenbrock <- function(x){
    x1 <- x[1]
    x2 <- x[2]
    100 * (x2 - x1 * x1)^2 + (1 - x1)^2
  }

  lower <- c(-10, -10)
  upper <- -lower
  
  set.seed(1234)
  outDEoptim <- DEoptim(Rosenbrock, lower, upper)
  
  ## print output information
  summary(outDEoptim)

  ## plot the best members
  plot(outDEoptim, type = 'b')

  ## plot the best values
  dev.new()
  plot(outDEoptim, plot.type = "bestvalit", type = 'b', col = 'blue')

  ## rerun the optimization, and store intermediate populations
  outDEoptim <- DEoptim(Rosenbrock, lower, upper,
                        DEoptim.control(itermax = 500,
                        storepopfrom = 1, storepopfreq = 2))
  summary(outDEoptim)
  
  ## plot intermediate populations
  dev.new()
  plot(outDEoptim, plot.type = "storepop")

  ## Wild function
  Wild <- function(x)
    10 * sin(0.3 * x) * sin(1.3 * x^2) +
       0.00001 * x^4 + 0.2 * x + 80

  outDEoptim = DEoptim(Wild, lower = -50, upper = 50,
                       DEoptim.control(trace = FALSE, storepopfrom = 50,
                       storepopfreq = 1))
  
  plot(outDEoptim, type = 'b')

  dev.new()
  plot(outDEoptim, plot.type = "bestvalit", type = 'b')

## Not run: 
##D   ## an example with a normal mixture model: requires package mvtnorm
##D   library(mvtnorm)
##D 
##D   ## neg value of the density function
##D   negPdfMix <- function(x) {
##D      tmp <- 0.5 * dmvnorm(x, c(-3, -3)) + 0.5 * dmvnorm(x, c(3, 3))
##D      -tmp
##D   }
##D 
##D   ## wrapper plotting function
##D   plotNegPdfMix <- function(x1, x2)
##D      negPdfMix(cbind(x1, x2))
##D 
##D   ## contour plot of the mixture
##D   x1 <- x2 <- seq(from = -10.0, to = 10.0, by = 0.1)
##D   thexlim <- theylim <- range(x1)
##D   z <- outer(x1, x2, FUN = plotNegPdfMix)
##D   
##D   contour(x1, x2, z, nlevel = 20, las = 1, col = rainbow(20),
##D      xlim = thexlim, ylim = theylim)
##D 
##D   set.seed(1234)
##D   outDEoptim <- DEoptim(negPdfMix, c(-10, -10), c(10, 10),
##D      DEoptim.control(NP = 100, itermax = 100, storepopfrom = 1,
##D      storepopfreq = 5))
##D 
##D   ## convergence plot
##D   dev.new()
##D   plot(outDEoptim)
##D   
##D   ## the intermediate populations indicate the bi-modality of the function
##D   dev.new()
##D   plot(outDEoptim, plot.type = "storepop")
## End(Not run)



