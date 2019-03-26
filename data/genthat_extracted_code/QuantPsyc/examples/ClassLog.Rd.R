library(QuantPsyc)


### Name: ClassLog
### Title: Classification for Logistic Regression
### Aliases: ClassLog
### Keywords: models

### ** Examples

# create some data
x <- rnorm(100)
y <- as.numeric(cut(.5*x + rnorm(100), breaks=2))-1
tdf <- data.frame(x=x, y=y)

# run a logistic regression	
glm1 <- glm(y ~ x, data=tdf, family=binomial)

# Get typical summary of results
summary(glm1)

# Classification Analysis
ClassLog(glm1, tdf$y)




