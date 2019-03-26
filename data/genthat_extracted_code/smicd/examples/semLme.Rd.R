library(smicd)


### Name: semLme
### Title: Linear Mixed Regression with Interval Censored Dependent
###   Variable
### Aliases: semLme

### ** Examples

## Not run: 
##D # Load and prepare data
##D data <- Exam
##D classes <- c(1,1.5,2.5,3.5,4.5,5.5,6.5,7.7,8.5, Inf)
##D data$examsc.class<- cut(data$examsc, classes)
##D 
##D # Run model with random intercept and default settings
##D model1 <- semLme(formula = examsc.class ~ standLRT + schavg + (1|school),
##D data = data, classes = classes)
##D summary(model1)
##D 
##D # Run model with random intercept + random slope with default settings
##D model2 <- semLme(formula = examsc.class ~ standLRT + schavg +
##D (standLRT|school), data = data, classes = classes)
##D summary(model2)
## End(Not run)## Don't show: 
# Load and prepare data
data <- Exam
classes <- c(1,1.5,2.5,3.5,4.5,5.5,6.5,7.7,8.5, Inf)
data$examsc.class<- cut(data$examsc, classes)

#Run model with random intercept and default settings
model1 <- semLme(formula = examsc.class ~ standLRT + schavg + (1|school),
data = data, classes = classes, burnin = 4, samples = 10)
summary(model1)
## End(Don't show)



