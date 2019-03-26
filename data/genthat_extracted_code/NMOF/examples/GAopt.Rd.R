library(NMOF)


### Name: GAopt
### Title: Optimisation with a Genetic Algorithm
### Aliases: GAopt
### Keywords: optimize

### ** Examples

## a *very* simple problem (why?):
## match a binary (logical) string y

size <- 20L  ### the length of the string
OF <- function(x, y) sum(x != y)
y <- runif(size) > 0.5
x <- runif(size) > 0.5
OF(y, y)     ### the optimum value is zero
OF(x, y)
algo <- list(nB = size, nP = 20L, nG = 100L, prob = 0.002,
             printBar = TRUE)
sol <- GAopt(OF, algo = algo, y = y)

## show differences (if any: marked by a '^')
cat(as.integer(y), "\n", as.integer(sol$xbest), "\n",
    ifelse(y == sol$xbest , " ", "^"), "\n", sep = "")

algo$nP <- 3L  ### that shouldn't work so well
sol2 <- GAopt(OF, algo = algo, y = y)

## show differences (if any: marked by a '^')
cat(as.integer(y), "\n", as.integer(sol2$xbest), "\n",
    ifelse(y == sol2$xbest , " ", "^"), "\n", sep = "")



