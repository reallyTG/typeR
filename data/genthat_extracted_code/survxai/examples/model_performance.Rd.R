library(survxai)


### Name: model_performance
### Title: Model performance for survival models
### Aliases: model_performance

### ** Examples

## No test: 
   library(survxai)
   library(rms)
   data("pbcTrain")
   data("pbcTest")
   cph_model <- cph(Surv(years, status)~., data=pbcTrain, surv=TRUE, x = TRUE, y=TRUE)
   surve_cph <- explain(model = cph_model, data = pbcTest[,-c(1,5)], 
                        y = Surv(pbcTest$years, pbcTest$status))
   mp_cph <- model_performance(surve_cph)
## End(No test)




