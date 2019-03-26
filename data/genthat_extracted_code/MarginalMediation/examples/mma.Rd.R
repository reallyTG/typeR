library(MarginalMediation)


### Name: mma
### Title: Marginal Mediation
### Aliases: mma

### ** Examples


## A minimal example:

library(furniture)
data(nhanes_2010)
bcpath = glm(marijuana ~ home_meals + gender + age + asthma, 
           data = nhanes_2010, 
           family = "binomial")
apath = glm(home_meals ~ gender + age + asthma,
           data = nhanes_2010, 
           family = "gaussian")
(fit = mma(bcpath, apath, 
           ind_effects = c("genderFemale-home_meals",
                           "age-home_meals",
                           "asthmaNo-home_meals"),
           boot = 10))




