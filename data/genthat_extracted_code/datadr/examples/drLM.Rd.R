library(datadr)


### Name: drLM
### Title: LM Transformation Method
### Aliases: drLM

### ** Examples

# Divide the data
bySpecies <- divide(iris, by = "Species")

# A function to fit a multiple linear regression model to each species
linearReg <- function(x)
  drLM(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width,
       data = x)

# Apply the transform and combine using 'combMeanCoef'
bySpecies %>%
  addTransform(linearReg) %>%
  recombine(combMeanCoef)




