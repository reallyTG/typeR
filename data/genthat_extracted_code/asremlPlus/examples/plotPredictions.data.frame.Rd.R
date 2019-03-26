library(asremlPlus)


### Name: plotPredictions.data.frame
### Title: Plots the predictions for a term, possibly with error bars.
### Aliases: plotPredictions.data.frame plotPredictions
### Keywords: asreml

### ** Examples
## Not run: 
##D data(WaterRunoff.dat)
##D asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D current.asr <- asreml(fixed = log.Turbidity ~ Benches + Sources + Type + Species +
##D                                 Sources:Type + Sources:Species + 
##D                                 Sources:xDay + Species:xDay + Species:Date,
##D                       data = WaterRunoff.dat, keep.order = TRUE)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D 
##D #### Get the observed combinations of the factors and variables in classify
##D class.facs <- c("Species","Date","xDay")
##D levs <- as.data.frame(table(WaterRunoff.dat[class.facs]))
##D levs <- as.list(levs[levs$Freq != 0, class.facs])
##D levs$xDay <- as.numfac(levs$xDay)
##D 
##D predictions <- predict(current.asr, classify="Species:Date:xDay", 
##D                        parallel = TRUE, levels = levs, 
##D                        present = c("Type","Species","Sources"))
##D #### for asreml-R3
##D predictions <- predictions$predictions$pvals
##D predictions <- predictions[predictions$est.status == "Estimable",]
##D #### for asreml-R4
##D predictions <- predictions$pvals
##D predictions <- predictions[predictions$status == "Estimable",]
##D #### end
##D plotPredictions(classify="Species:Date:xDay", y = "predicted.value", 
##D                 data = predictions, 
##D                 x.num = "xDay", x.fac = "Date", 
##D                 x.title = "Days since first observation",
##D                 y.title = "Predicted log(Turbidity)",
##D                 present = c("Type","Species","Sources"),
##D                 error.intervals = "none",
##D                 ggplotFuncs = list(ggtitle("Transformed turbidity over time")))
##D   
##D diffs <- predictPlus(classify="Species:Date:xDay", 
##D                      present=c("Type","Species","Sources"), 
##D                      asreml.obj = current.asr, tables = "none", 
##D                      x.num = "xDay", x.fac = "Date", 
##D                      parallel = TRUE, levels = levs, 
##D                      x.plot.values=c(0,28,56,84),
##D                      wald.tab = current.asrt$wald.tab)
##D x.title <- "Days since first observation"
##D names(x.title) <- "xDay"
##D plotPredictions(classify="Species:Date:xDay", y = "predicted.value", 
##D                data = diffs$predictions, 
##D                x.num = "xDay", x.fac = "Date", 
##D                titles = x.title,
##D                y.title = "Predicted log(Turbidity)")
## End(Not run)

## Use lmerTest and emmmeans to get predictions and associated statistics
if (requireNamespace("lmerTest", quietly = TRUE) & 
    requireNamespace("emmeans", quietly = TRUE))
{
  data(Ladybird.dat)
  m1.lmer <- lmerTest::lmer(logitP ~ Host*Cadavers*Ladybird + (1|Run),
                            data=Ladybird.dat)
  HCL.emm <- emmeans::emmeans(m1.lmer, specs = ~ Host:Cadavers:Ladybird)
  HCL.preds <- summary(HCL.emm)
  den.df <- min(HCL.preds$df)
  ## Modify HCL.preds to be compatible with a predictions.frame
  HCL.preds <- as.predictions.frame(HCL.preds, predictions = "emmean", 
                                   se = "SE", interval.type = "CI", 
                                   interval.names = c("lower.CL", "upper.CL"))
  ## Plot the predictions
  plotPredictions(HCL.preds, y = "predicted.value", "Host:Cadavers:Ladybird")
}



