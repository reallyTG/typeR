library(funModeling)


### Name: gain_lift
### Title: Generates lift and cumulative gain performance table and plot
### Aliases: gain_lift

### ** Examples

fit_glm=glm(has_heart_disease ~ age + oldpeak, data=heart_disease, family = binomial)
heart_disease$score=predict(fit_glm, newdata=heart_disease, type='response')
gain_lift(data=heart_disease, score='score', target='has_heart_disease')




