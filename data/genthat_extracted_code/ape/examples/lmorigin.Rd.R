library(ape)


### Name: lmorigin
### Title: Multiple regression through the origin
### Aliases: lmorigin print.lmorigin lmorigin.ex1 lmorigin.ex2
### Keywords: multivariate

### ** Examples

## Example 1 from Sokal & Rohlf (1995) Table 16.1
## SO2 air pollution in 41 cities of the USA
data(lmorigin.ex1)
out <- lmorigin(SO2 ~ ., data=lmorigin.ex1, origin=FALSE, nperm=99)
out

## Example 2: Contrasts computed on the phylogenetic tree of Lamellodiscus
## parasites. Response variable: non-specificity index (NSI); explanatory
## variable: maximum host size. Data from Table 1 of Legendre & Desdevises
## (2009).
data(lmorigin.ex2)
out <- lmorigin(NSI ~ MaxHostSize, data=lmorigin.ex2, origin=TRUE, nperm=99)
out

## Example 3: random numbers
y <- rnorm(50)
X <- as.data.frame(matrix(rnorm(250),50,5))
out <- lmorigin(y ~ ., data=X, origin=FALSE, nperm=99)
out




