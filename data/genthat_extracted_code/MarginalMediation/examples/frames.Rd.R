library(MarginalMediation)


### Name: frames
### Title: Average Marginal Effects
### Aliases: frames

### ** Examples


library(furniture)
data(nhanes_2010)
fit = glm(marijuana ~ home_meals + gender + age + asthma, 
           data = nhanes_2010, 
           family = "binomial")
frames(fit)





