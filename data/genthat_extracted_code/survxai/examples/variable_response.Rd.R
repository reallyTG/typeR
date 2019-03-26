library(survxai)


### Name: variable_response
### Title: Variable response for survival models
### Aliases: variable_response

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
## End(No test)



