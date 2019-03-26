library(REPTILE)


### Name: reptile_eval_prediction
### Title: Evaluating the prediction results
### Aliases: reptile_eval_prediction
### Keywords: result evaluation

### ** Examples

library("REPTILE")
data("rsd")

## Training
rsd_model <- reptile_train(rsd$training_data$region_epimark,
                           rsd$training_data$region_label,
                           rsd$training_data$DMR_epimark,
                           rsd$training_data$DMR_label,
                           ntree=50)

## Prediction
## - REPTILE
pred <- reptile_predict(rsd_model,
                        rsd$test_data$region_epimark,
                        rsd$test_data$DMR_epimark)
## - Random guessing
pred_guess = runif(length(pred$D))
names(pred_guess) = names(pred$D)

## Evaluation
res_reptile <- reptile_eval_prediction(pred$D,
                                       rsd$test_data$region_label)
res_guess <- reptile_eval_prediction(pred_guess,
                                     rsd$test_data$region_label)
## - Print AUROC and AUPR
cat(paste0("REPTILE\n",
           "  AUROC = ",round(res_reptile$AUROC,digit=3),
           "\n",
           "  AUPR  = ",round(res_reptile$AUPR,digit=3))
    ,"\n")
cat(paste0("Random guessing\n",
           "  AUROC = ",round(res_guess$AUROC,digit=3),
           "\n",
           "  AUPR  = ",round(res_guess$AUPR,digit=3))
   ,"\n")




