library(simecol)


### Name: neighbours
### Title: Count Number of Neighbours on a Rectangular Grid.
### Aliases: neighbours neighbors
### Keywords: array

### ** Examples

## ==================================================================
## Demonstration of the neighborhood function alone
## ==================================================================

## weight matrix for neighbourhood determination
wdist <- matrix(c(0.5,0.5,0.5,0.5,0.5,
                  0.5,1.0,1.0,1.0,0.5,
                  0.5,1.0,1.0,1.0,0.5,
                  0.5,1.0,1.0,1.0,0.5,
                  0.5,0.5,0.5,0.5,0.5), nrow=5)

## state matrix                  
n <- 20; m <- 20
x <- matrix(rep(0, m * n), nrow = n)

## set state of some cells to 1
x[10, 10] <- 1
x[1, 5]   <- 1
x[n, 15]  <- 1
x[5, 2]   <- 1
x[15, m]  <- 1
#x[n, 1]   <- 1 # corner

opar <- par(mfrow = c(2, 2))
## start population
image(x)
## open boundaries
image(matrix(neighbours(x, wdist = wdist, bounds = 0), nrow = n))
## torus (donut like)
image(matrix(neighbours(x, wdist = wdist, bounds = 1), nrow = n))
## cylinder (left and right boundaries connected)
image(matrix(neighbours(x, wdist = wdist, bounds = c(0, 1, 0, 1)), nrow = n))
par(opar) # reset graphics area                  
                  
## ==================================================================
## The following example demonstrates a "plain implementation" of a
## stochastic cellular automaton i.e. without the simecol structure.
##
## A simecol implementation of this can be found in
## the example directory of this package (file: stoch_ca.R).
## ==================================================================                  
mycolors <- function(n) {
  col <- c("wheat", "darkgreen")
  if (n>2) col <- c(col, heat.colors(n - 2))
  col
}

pj <- 0.99  # survival probability of juveniles
pa <- 0.99  # survival probability of adults
ps <- 0.1   # survival probability of senescent
ci <- 1.0   # "seeding constant"
adult <- 5  # age of adolescence
old   <- 10 # age of senescence

## Define a start population
n <- 80
m <- 80
x <- rep(0, m*n)

## stochastic seed
## x[round(runif(20,1,m*n))] <- adult
dim(x)<- c(n, m)

## rectangangular seed in the middle
x[38:42, 38:42] <- 5

## plot the start population
image(x, col = mycolors(2))

## -----------------------------------------------------------------------------
## Simulation loop (hint: increase loop count)
## -----------------------------------------------------------------------------
for (i in 1:10){

  ## rule 1: reproduction
  ## 1.1 which cells are adult? (only adults can generate)
  ad <- ifelse(x >= adult & x < old, x, 0)

  ## 1.2 how much (weighted) adult neighbours has each cell?
  nb <- neighbours(ad, wdist = wdist)

  ## 1.3 a proportion of the seeds develops juveniles
  ## simplified version, you can also use probabilities
  genprob <- nb * runif(nb) * ci
  xgen  <- ifelse(x == 0 & genprob >= 1, 1, 0)

  ## rule 2: growth and survival of juveniles
  xsurvj <- ifelse(x >= 1 & x < adult & runif(x) <= pj, x+1, 0)
  ## rule 2: growth and survival of adults
  xsurva <- ifelse(x >= adult & x < old & runif(x) <= pa, x+1, 0)
  ## rule 2: growth and survival of senescent
  xsurvs <- ifelse(x >= old & runif(x) <= ps, x+1, 0)

  ## make resulting grid of complete population
  x     <- xgen + xsurvj + xsurva + xsurvs

  ## plot resulting grid
  image(x, col = mycolors(max(x) + 1), add = TRUE)
  if (max(x) == 0) stop("extinction", call. = FALSE)
}

## modifications:  pa<-pj<-0.9

## additional statistics of population structure
## with table, hist, mean, sd, ...



