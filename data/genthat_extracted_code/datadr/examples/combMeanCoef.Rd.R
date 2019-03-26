library(datadr)


### Name: combMeanCoef
### Title: Mean Coefficient Recombination
### Aliases: combMeanCoef

### ** Examples

# Create an irregular number of observations for each species
indexes <- sort(c(sample(1:50, 40), sample(51:100, 37), sample(101:150, 46)))
irisIrr <- iris[indexes,]

# Create a distributed data frame using the irregular iris data set
bySpecies <- divide(irisIrr, by = "Species")

# Fit a linear model of Sepal.Length vs. Sepal.Width for each species
# using 'drLM()' (or we could have used 'drGLM()' for a generlized linear model)
lmTrans <- function(x) drLM(Sepal.Length ~ Sepal.Width, data = x)
bySpeciesFit <- addTransform(bySpecies, lmTrans)

# Average the coefficients from the linear model fits of each species, weighted
# by the number of observations in each species
out1 <- recombine(bySpeciesFit, combine = combMeanCoef)
out1

# A more concise (and readable) way to do it
bySpecies %>%
  addTransform(lmTrans) %>%
  recombine(combMeanCoef)

# The following illustrates an equivalent, but more tedious approach
lmTrans2 <- function(x) t(c(coef(lm(Sepal.Length ~ Sepal.Width, data = x)), n = nrow(x)))
res <- recombine(addTransform(bySpecies, lmTrans2), combine = combRbind)
colnames(res) <- c("Species", "Intercept", "Sepal.Width", "n")
res
out2 <- c("(Intercept)" = with(res, sum(Intercept * n) / sum(n)),
          "Sepal.Width" = with(res, sum(Sepal.Width * n) / sum(n)))

# These are the same
identical(out1, out2)




