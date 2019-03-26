library(TBFmultinomial)


### Name: CSVS
### Title: Cause-specific variable selection (CSVS)
### Aliases: CSVS

### ** Examples

# data extraction:
data("VAP_data")

# the definition of the full model with three potential predictors:
FULL <- outcome ~ ns(day, df = 4) + gender + type + SOFA
# here the define time as a spline with 3 knots

# we first need to fit the multinomial model:
model_full <- multinom(formula = FULL, data = VAP_data,
                       maxit = 150, trace = FALSE)

G <- 9 # let's suppose g equals to nine

# then we proceed to CSVS
CSVS_nnet <- CSVS(g = G, model = model_full,
                  discreteSurv = TRUE, package = 'nnet')



