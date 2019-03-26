library(survxai)


### Name: ceteris_paribus
### Title: Ceteris Paribus
### Aliases: ceteris_paribus

### ** Examples

## No test: 
library(survxai)
library(rms) 
data("pbcTrain")
data("pbcTest")
predict_times <- function(model, data, times){ 
                    prob <- rms::survest(model, data, times = times)$surv
                    return(prob)
                  }
cph_model <- cph(Surv(years, status)~., data = pbcTrain, surv = TRUE, x = TRUE, y=TRUE)
surve_cph <- explain(model = cph_model, data = pbcTest[,-c(1,5)], 
             y = Surv(pbcTest$years, pbcTest$status), 
             predict_function = predict_times)
cp_cph <- ceteris_paribus(surve_cph, pbcTest[1,-c(1,5)])
## End(No test)



