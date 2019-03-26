library(MoEClust)


### Name: drop_constants
### Title: Drop constant variables from a formula
### Aliases: drop_constants
### Keywords: utility

### ** Examples

data(ais)
hema  <- as.matrix(ais[,3:7])
sex   <- ais$sex
BMI   <- ais$BMI

# Set up a no-intercept regression formula with constant column 'sex'
form1 <- as.formula(hema ~ sex + BMI - 1)
sub   <- ais$sex == "male"

# Try fitting a linear model
mod1  <- try(lm(form1, data=ais, subset=sub), silent=TRUE)
inherits(mod1, "try-error") # TRUE

# Remove redundant variables from formula & try again
form2 <- drop_constants(ais, form1, sub)
mod2  <- try(lm(form2, data=ais, subset=sub), silent=TRUE)
inherits(mod2, "try-error") # FALSE



