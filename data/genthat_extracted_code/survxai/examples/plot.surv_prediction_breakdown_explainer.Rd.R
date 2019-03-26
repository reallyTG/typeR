library(survxai)


### Name: plot.surv_prediction_breakdown_explainer
### Title: Plot for surv_breakdown object
### Aliases: plot.surv_prediction_breakdown_explainer

### ** Examples

## No test: 
library(survxai)
library(rms)
data("pbcTest")
data("pbcTrain")
predict_times <- function(model, data, times){
                  prob <- rms::survest(model, data, times = times)$surv
                  return(prob)
                  }
cph_model <- cph(Surv(years, status)~., data=pbcTrain, surv=TRUE, x = TRUE, y=TRUE)
surve_cph <- explain(model = cph_model, data = pbcTest[,-c(1,5)], 
                    y = Surv(pbcTest$years, pbcTest$status), predict_function = predict_times)
broken_prediction <- prediction_breakdown(surve_cph, pbcTest[1,-c(1,5)])
plot(broken_prediction)
## End(No test)



