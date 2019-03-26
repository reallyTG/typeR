library(Sleuth2)


### Name: case1402
### Title: Effect of Ozone, SO2 and Drought on Soybean Yield
### Aliases: case1402
### Keywords: datasets

### ** Examples

str(case1402)

plot(Forrest ~ O3,  case1402, log="y", pch=ifelse(Stress=="Stressed",19,21))
plot(Forrest ~ SO2, case1402, log="y", pch=ifelse(Stress=="Stressed",19,21))

fitbig <- lm(log(Forrest) ~  O3*SO2*Stress, case1402)
# Residual plot does not indicate any problem.
plot(fitbig) 
# The 3-factor interaction is not statistically significant.
anova(fitbig)  
# Drop the three-factor interaction
fit2 <- update(fitbig, ~ . - O3:SO2:Stress) 
anova(fit2)

fitadditive <- lm(log(Forrest) ~ O3 + SO2 + Stress, case1402)
summary(fitadditive)



