library(MVN)


### Name: mvn
### Title: Multivariate Normality Tests
### Aliases: mvn

### ** Examples

result = mvn(data = iris[-4], subset = "Species", mvnTest = "hz",
             univariateTest = "AD", univariatePlot = "histogram",
             multivariatePlot = "qq", multivariateOutlierMethod = "adj",
             showOutliers = TRUE, showNewData = TRUE)

#### Multivariate Normality Result
result$multivariateNormality

### Univariate Normality Result
result$univariateNormality

### Descriptives
result$Descriptives

### Multivariate Outliers
result$multivariateOutliers

### New data without multivariate outliers
result$newData

# Note that this function also creates univariate histograms,
# multivariate Q-Q plots for multivariate normality assessment
# and multivariate outlier detection.




