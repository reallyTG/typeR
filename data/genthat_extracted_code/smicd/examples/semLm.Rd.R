library(smicd)


### Name: semLm
### Title: Linear Regression with Interval Censored Dependent Variable
### Aliases: semLm

### ** Examples

## Not run: 
##D # Load and prepare data
##D data <- Exam
##D classes <- c(1,1.5,2.5,3.5,4.5,5.5,6.5,7.7,8.5, Inf)
##D data$examsc.class<- cut(data$examsc, classes)
##D 
##D # Run model with default settings
##D model <- semLm(formula = examsc.class ~ standLRT + schavg, data = data,
##D classes = classes)
##D summary(model)
## End(Not run) ## Don't show: 
# Load and prepare data
data <- Exam
classes <- c(1,1.5,2.5,3.5,4.5,5.5,6.5,7.7,8.5, Inf)
data$examsc.class<- cut(data$examsc, classes)

# Run model with default settings
model <- semLm(formula = examsc.class ~ standLRT + schavg, data = data,
classes = classes, burnin = 4, samples = 10)
summary(model)
## End(Don't show)



