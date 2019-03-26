library(flexmix)


### Name: seizure
### Title: Epileptic Seizure Data
### Aliases: seizure
### Keywords: datasets

### ** Examples

data("seizure", package = "flexmix")
plot(Seizures/Hours ~ Day, col = as.integer(Treatment),
     pch = as.integer(Treatment), data = seizure)
abline(v = 27.5, lty = 2, col = "grey")
legend(140, 9, c("Baseline", "Treatment"),
       pch = 1:2, col = 1:2, xjust = 1, yjust = 1)

set.seed(123)

## The model presented in the Wang et al paper: two components for
## "good" and "bad" days, respectively, each a Poisson GLM with hours of
## parental observation as offset

seizMix <- flexmix(Seizures ~ Treatment * log(Day),
                   data = seizure, k = 2,
                   model = FLXMRglm(family = "poisson",
                     offset = log(seizure$Hours)))

summary(seizMix)
summary(refit(seizMix))

matplot(seizure$Day, fitted(seizMix)/seizure$Hours, type = "l",
        add = TRUE, col = 3:4)



