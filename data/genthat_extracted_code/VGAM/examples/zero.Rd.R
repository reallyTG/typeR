library(VGAM)


### Name: zero
### Title: The zero Argument in VGAM Family Functions
### Aliases: zero
### Keywords: models regression programming

### ** Examples

args(multinomial)
args(binom2.or)
args(gpd)

#LMS quantile regression example
fit <- vglm(BMI ~ sm.bs(age, df = 4), lms.bcg(zero = c(1, 3)),
            data = bmi.nz, trace = TRUE)
coef(fit, matrix = TRUE)



