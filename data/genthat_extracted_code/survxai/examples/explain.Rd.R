library(survxai)


### Name: explain.default
### Title: Create Survival Model Explainer
### Aliases: explain.default explain

### ** Examples

## No test: 
library(survxai)
library(rms)
library(randomForestSRC)
data(pbc, package = "randomForestSRC")
pbc <- pbc[complete.cases(pbc),]
predict_times <- function(model, data, times){
                  prob <- rms::survest(model, data, times = times)$surv
                  return(prob)
                  }
cph_model <- cph(Surv(days/365, status)~., data=pbc, surv=TRUE, x = TRUE, y=TRUE)
surve_cph <- explain(model = cph_model, data = pbc[,-c(1,2)], y = Surv(pbc$days/365, pbc$status),
             predict_function = predict_times)
## End(No test)



