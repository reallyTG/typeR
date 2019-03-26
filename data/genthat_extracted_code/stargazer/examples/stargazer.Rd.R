library(stargazer)


### Name: stargazer
### Title: stargazer
### Aliases: stargazer stargazer-package
### Keywords: package models regression nonlinear univar interface
###   programming IO

### ** Examples

## create summary statistics table for 'attitude' data frame
stargazer(attitude)

## list the content of the data frame 'attitude'
stargazer(attitude, summary=FALSE)

##  2 OLS models
linear.1 <- lm(rating ~ complaints + privileges + learning 
                        + raises + critical, data=attitude)

linear.2 <- lm(rating ~ complaints + privileges + learning, data=attitude)

## create an indicator dependent variable, and run a probit model
 
attitude$high.rating <- (attitude$rating > 70)
probit.model <- glm(high.rating ~ learning + critical + advance, data=attitude,
                    family = binomial(link = "probit"))
 
stargazer(linear.1, linear.2, probit.model, title="Regression Results")

## report ASCII text for a table with 90 percent confidence
## intervals reported on the same row as coefficients
## and omitting F statistics and the residual standard error

stargazer(linear.1, linear.2, probit.model, type="text",
          title="Regression Results", single.row=TRUE,
          ci=TRUE, ci.level=0.9, omit.stat=c("f", "ser"))
          
### re-order the models and only keep explanatory
### variables that contain "complaints", "learning", 
### "raises" and "critical"; report these with standard
### errors, and put "learning" and "raises" before
### the other explanatory variables; of the summary
### statistics, only keep the number of observations

stargazer(probit.model, linear.1, linear.2, type="text",
          keep=c("complaints","learning","raises","critical"),
          keep.stat="n", order=c("learning", "raises"))

### apply a function to the coefficients and standard errors
### that will multiply them by ten; you can think of this
### as a change in units

multiply.by.10 <- function(x) (x * 10)

stargazer(probit.model, linear.1, linear.2,
          apply.coef=multiply.by.10, apply.se=multiply.by.10)
          
### print out HTML code for a correlation matrix

correlation.matrix <- cor(attitude)
stargazer(correlation.matrix, type="html")




