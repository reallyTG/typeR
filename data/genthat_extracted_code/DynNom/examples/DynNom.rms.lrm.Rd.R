library(DynNom)


### Name: DynNom.lrm
### Title: Dynamic Nomograms for Logistic Regression Models from the 'rms'
###   package
### Aliases: DynNom.lrm
### Keywords: dynamic nomograms logistic regression models individual
###   prediction shiny

### ** Examples

## Not run: 
##D # example
##D n <- 1000
##D set.seed(17)
##D age            <- rnorm(n, 50, 10)
##D blood.pressure <- rnorm(n, 120, 15)
##D cholesterol    <- rnorm(n, 200, 25)
##D sex            <- factor(sample(c('female', 'male'), n, TRUE))
##D label(age)            <- 'Age'      # label is in Hmisc
##D label(cholesterol)    <- 'Total Cholesterol'
##D label(blood.pressure) <- 'Systolic Blood Pressure'
##D label(sex)            <- 'Sex'
##D units(cholesterol)    <- 'mg/dl'
##D units(blood.pressure) <- 'mmHg'
##D 
##D ch <- cut2(cholesterol, g = 40, levels.mean = TRUE)
##D 
##D d <- data.frame(age = seq(0, 90, by = 10))
##D 
##D L <- .4 * (sex == 'male') + .045 * (age - 50) +
##D   (log(cholesterol - 10) - 5.2) * ( -2 * (sex == 'female') + 2 * (sex == 'male'))
##D y <- ifelse(runif(n) < plogis(L), 1, 0)
##D cholesterol[1:3] <- NA
##D 
##D ddist <- datadist(age, blood.pressure, cholesterol, sex)
##D options(datadist = 'ddist')
##D 
##D data = data.frame(y = y, blood.pressure = blood.pressure, sex = sex, age = age,
##D cholesterol = cholesterol)
##D model <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol, 4)),
##D              x = TRUE, y = TRUE, m.summary = "formatted")
##D 
##D DynNom.lrm(model, data, m.summary = "formatted")
## End(Not run)

if (interactive()) {
fit <- lrm(formula = vs ~ wt + disp, data = mtcars)
DynNom.lrm(fit, mtcars, clevel = 0.9)
}



