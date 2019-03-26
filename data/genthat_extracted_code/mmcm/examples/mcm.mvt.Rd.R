library(mmcm)


### Name: mcm.mvt
### Title: The maximum contrast method by using the randomized quasi-Monte
###   Carlo method
### Aliases: mcm.mvt
### Keywords: htest

### ** Examples

## Example 1 ##
#  true response pattern: dominant model c=(1, 1, -2)
set.seed(136885)
x <- c(
  rnorm(130, mean =  1 / 6, sd = 1),
  rnorm( 90, mean =  1 / 6, sd = 1),
  rnorm( 10, mean = -2 / 6, sd = 1)
)
g <- rep(1:3, c(130, 90, 10))
boxplot(
  x ~ g,
  width = c(length(g[g==1]), length(g[g==2]), length(g[g==3])),
  main = "Dominant model (sample data)",
  xlab = "Genotype",
  ylab = "PK parameter"
)

# coefficient matrix
# c_1: additive, c_2: recessive, c_3: dominant
contrast <- rbind(
  c(-1, 0, 1), c(-2, 1, 1), c(-1, -1, 2)
)
y <- mcm.mvt(x, g, contrast)
y

## Example 2 ##
#  for dataframe
#  true response pattern: pos = 1 dominant  model c=( 1,  1, -2)
#                               2 additive  model c=(-1,  0,  1)
#                               3 recessive model c=( 2, -1, -1)
set.seed(3872435)
x <- c(
  rnorm(130, mean =  1 / 6, sd = 1),
  rnorm( 90, mean =  1 / 6, sd = 1),
  rnorm( 10, mean = -2 / 6, sd = 1),
  rnorm(130, mean = -1 / 4, sd = 1),
  rnorm( 90, mean =  0 / 4, sd = 1),
  rnorm( 10, mean =  1 / 4, sd = 1),
  rnorm(130, mean =  2 / 6, sd = 1),
  rnorm( 90, mean = -1 / 6, sd = 1),
  rnorm( 10, mean = -1 / 6, sd = 1)
)
g   <- rep(rep(1:3, c(130, 90, 10)), 3)
pos <- rep(c("rsXXXX", "rsYYYY", "rsZZZZ"), each=230)
xx  <- data.frame(pos = pos, x = x, g = g)

# coefficient matrix
# c_1: additive, c_2: recessive, c_3: dominant
contrast <- rbind(
  c(-1, 0, 1), c(-2, 1, 1), c(-1, -1, 2)
)
mmcmtapply <- function(r) {
  mcm.mvt(
    xx$x[xx$pos==r[1]], xx$g[xx$pos==r[1]],
    contrast
  )
}
y <- tapply(xx$pos, xx$pos, mmcmtapply)
yy <- data.frame(
  Pos       = as.vector(names(y)),
  Pval      = as.vector(sapply(y, "[[", 3)),
  Pattern   = as.vector(sapply(y, "[[", 7)),
  QMC_Error = as.vector(sapply(y, "[[", 9))
)
# miss-detection!
yy



