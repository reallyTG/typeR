library(ModelGood)


### Name: Sensitivity
### Title: Compute sensitivity, specificity and predictive values
### Aliases: Diagnose NPV PPV Sensitivity Specificity

### ** Examples

set.seed(17)
x <- rnorm(10)
y <- rbinom(10,1,0.4)
Sensitivity(x,y,0.3)
Specificity(x,y,0.3)
PPV(x,y,0.3)
NPV(x,y,0.3)

Diagnose(x,y,0.3)



