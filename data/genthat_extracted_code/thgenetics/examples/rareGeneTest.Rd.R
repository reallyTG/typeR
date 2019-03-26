library(thgenetics)


### Name: rareGeneTest
### Title: Rare Variant Tests
### Aliases: rareGeneTest rarePathwayTest
### Keywords: interface

### ** Examples

## This inefficient (for clarity) code will simulate
##  a dataset in the correct format, and then run
##  the different approaches described here.

## Constants for data generation
SEED <- 2
NCASE <- NCONT <- 500
NGENE <- 6
FUNCTIONAL <- 1:(NGENE/2)  ## Half are functional
BETA0 <- -4
BETAG <- log(2)

set.seed(SEED) ## Reproducible results

nonfunctional <- setdiff(1:NGENE, FUNCTIONAL)
afreq <- runif(NGENE, 0.001, 0.01)

expit <- function(x)
  return(exp(x) / (1 + exp(x)))

gcase <- matrix(0, nrow=NCASE, ncol=NGENE)
for(indiv in 1:NCASE){
  affected <- FALSE
  while(!affected){ ## while not affected
    gcase[indiv, ] <- rbinom(NGENE, 2, afreq)  ## draw up genotype
    affected <- (expit(BETA0 + 
      BETAG*sum(gcase[indiv, FUNCTIONAL])) > runif(1))
  }
}
cat("\n")

gcont <- matrix(0, nrow=NCONT, ncol=NGENE)
for(indiv in 1:NCONT){
  unaffected <- FALSE
  while(!unaffected){ ## while not unaffected
    gcont[indiv, ] <- rbinom(NGENE, 2, afreq) ## draw up genotype
    unaffected <- (1-expit(BETA0 +
      BETAG*sum(gcont[indiv, FUNCTIONAL])) > runif(1))
  }
}
cat("\n")

cat("# Rare functional variants cases =", 
  sum(gcase[,FUNCTIONAL]), "\n")
cat("# Rare functional variants controls =",
  sum(gcont[,FUNCTIONAL]), "\n")
cat("# Rare non-functional variants cases =",
  sum(gcase[,nonfunctional]), "\n")
cat("# Rare non-functional variants controls =",
  sum(gcont[,nonfunctional]), "\n")

case <- c(rep(1,NCASE), rep(0,NCONT))
genotype <- rbind(gcase, gcont)

cat("P-value of the test:\n")
rareGeneTest(genotype, case)



