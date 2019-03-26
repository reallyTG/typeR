## ------------------------------------------------------------------------
variation_gaussmut <- function(X, mean = 0, sd = 0.1, p = 0.1, ...) {
  # You want to do some error checking on the parameters here
  # But for the sake of brevity in this case study, we are skipping it.
  
  R <- rnorm(length(X),    # vector of normally distributed values, 
             mean = mean,  # length(R) = nrow(X) * ncol(X)
             sd   = sd)
  R <- R * (runif(length(X)) <= p) # Apply binary mask, probability = p
  return (X + R)                   # Add mutations to the solution matrix
}

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(MOEADr))
suppressPackageStartupMessages(library(smoof))

ZDT1 <- make_vectorized_smoof(prob.name  = "ZDT1",
                              dimensions = 30)
problem.zdt1  <- list(name       = "ZDT1",
                      xmin       = rep(0, 30),
                      xmax       = rep(1, 30),
                      m          = 2)


myvar <- list()                                   # Initialize variation stack
myvar[[1]] <- list(name = "gaussmut", p = 0.5)    # Our new operator
myvar[[2]] <- list(name = "truncate")             # Truncation repair operator

results.orig  <- moead(problem  = problem.zdt1,
                       preset   = preset_moead("original"),
                       showpars = list(show.iters = "none"), 
                       seed     = 42)
results.myvar <- moead(problem  = problem.zdt1,
                       preset   = preset_moead("original"),
                       variation = myvar,
                       showpars = list(show.iters = "none"), 
                       seed     = 42)

## ---- fig.width = 5.5, fig.height = 5.5, fig.align="center"--------------
plot(results.orig, suppress.pause = TRUE)
plot(results.myvar, suppress.pause = TRUE)

