library(survxai)


### Name: plot.surv_variable_response_explainer
### Title: Plot for surv_variable_response object
### Aliases: plot.surv_variable_response_explainer

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
svr_cph <- variable_response(surve_cph, "sex")
plot(svr_cph)
## End(No test)




