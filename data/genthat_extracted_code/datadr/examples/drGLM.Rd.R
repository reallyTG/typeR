library(datadr)


### Name: drGLM
### Title: GLM Transformation Method
### Aliases: drGLM

### ** Examples

# Artificially dichotomize the Sepal.Lengths of the iris data to
# demonstrate a GLM model
irisD <- iris
irisD$Sepal <- as.numeric(irisD$Sepal.Length > median(irisD$Sepal.Length))

# Divide the data
bySpecies <- divide(irisD, by = "Species")

# A function to fit a logistic regression model to each species
logisticReg <- function(x)
  drGLM(Sepal ~ Sepal.Width + Petal.Length + Petal.Width,
        data = x, family = binomial())

# Apply the transform and combine using 'combMeanCoef'
bySpecies %>%
  addTransform(logisticReg) %>%
  recombine(combMeanCoef)




