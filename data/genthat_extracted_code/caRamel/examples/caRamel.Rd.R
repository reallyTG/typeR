library(caRamel)


### Name: caRamel
### Title: caRamel
### Aliases: caRamel

### ** Examples

# Definition of the test function
viennet <- function(i) {
  val1 <- 0.5*(x[i,1]*x[i,1]+x[i,2]*x[i,2])+sin(x[i,1]*x[i,1]+x[i,2]*x[i,2])
  val2 <- 15+(x[i,1]-x[i,2]+1)*(x[i,1]-x[i,2]+1)/27+(3*x[i,1]-2*x[i,2]+4)*(3*x[i,1]-2*x[i,2]+4)/8
  val3 <- 1/(x[i,1]*x[i,1]+x[i,2]*x[i,2]+1) -1.1*exp(-(x[i,1]*x[i,1]+x[i,2]*x[i,2]))
  return(c(val1,val2,val3))
}
# Number of objectives
nobj <- 3
# Number of variables
nvar <- 2
# All the objectives are to be minimized
minmax <- c(FALSE, FALSE, FALSE)
# Define the bound constraints
bounds <- matrix(data = 1, nrow = nvar, ncol = 2)
bounds[, 1] <- -3 * bounds[, 1]
bounds[, 2] <- 3 * bounds[, 2]

# Caramel optimization
results <-
  caRamel(nobj = nobj,
          nvar = nvar,
          minmax =  minmax,
          bounds = bounds,
          func = viennet,
          popsize = 100,
          archsize = 100,
          maxrun = 500,
          prec = matrix(1.e-3, nrow = 1, ncol = nobj),
          carallel = FALSE)




