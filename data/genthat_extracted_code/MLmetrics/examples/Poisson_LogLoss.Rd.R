library(MLmetrics)


### Name: Poisson_LogLoss
### Title: Poisson Log loss
### Aliases: Poisson_LogLoss

### ** Examples

d_AD <- data.frame(treatment = gl(3,3), outcome = gl(3,1,9),
                   counts = c(18,17,15,20,10,20,25,13,12))
glm_poisson <- glm(counts ~ outcome + treatment,
                   family = poisson(link = "log"), data = d_AD)
Poisson_LogLoss(y_pred = glm_poisson$fitted.values, y_true = d_AD$counts)



