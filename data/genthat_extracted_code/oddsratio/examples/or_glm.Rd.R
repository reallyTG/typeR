library(oddsratio)


### Name: or_glm
### Title: Calculate odds ratios of Generalized Linear (Mixed) Models
### Aliases: or_glm

### ** Examples

## Example with glm()
# load data (source: http://www.ats.ucla.edu/stat/r/dae/logit.htm) and
# fit model
fit_glm <- glm(admit ~ gre + gpa + rank, data = data_glm,
               family = "binomial") # fit model

# Calculate OR for specific increment step of continuous variable
or_glm(data = data_glm, model = fit_glm, incr = list(gre = 380, gpa = 5))

# Calculate OR and change the confidence interval level
or_glm(data = data_glm, model = fit_glm,
       incr = list(gre = 380, gpa = 5), CI = .70)

## Example with MASS:glmmPQL()
# load data
library(MASS)
data(bacteria)
fit_glmmPQL <- glmmPQL(y ~ trt + week, random = ~1 | ID,
                       family = binomial, data = bacteria,
                       verbose = FALSE)

# Apply function
or_glm(data = bacteria, model = fit_glmmPQL, incr = list(week = 5))




