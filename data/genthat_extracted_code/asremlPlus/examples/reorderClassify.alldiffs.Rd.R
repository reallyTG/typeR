library(asremlPlus)


### Name: reorderClassify.alldiffs
### Title: Reorders the components in an 'alldiffs.object' according to a
###   new classify.
### Aliases: reorderClassify.alldiffs reorderClassify
### Keywords: asreml

### ** Examples

data(WaterRunoff.dat)

##Use asreml to get predictions and associated statistics

## Not run: 
##D #Analyse pH  
##D m1.asr <- asreml(fixed = pH ~ Benches + (Sources * (Type + Species)), 
##D                  random = ~ Benches:MainPlots,
##D                  keep.order=TRUE, data= WaterRunoff.dat)
##D current.asrt <- asrtests(m1.asr, NULL, NULL)
##D current.asrt <- asrtests(m1.asr)
##D current.asrt <- rmboundary(current.asrt)
##D m1.asr <- current.asrt$asreml.obj
##D 
##D #Get predictions and associated statistics  
##D TS.diffs <- predictPlus.asreml(classify = "Sources:Type", 
##D                                asreml.obj = m1.asr, tables = "none", 
##D                                wald.tab = current.asrt$wald.tab, 
##D                                present = c("Type","Species","Sources"))
## End(Not run)

## Use lmeTest and emmmeans to get predictions and associated statistics

if (requireNamespace("lmerTest", quietly = TRUE) & 
    requireNamespace("emmeans", quietly = TRUE))
{
  #Analyse pH
  m1.lmer <- lmerTest::lmer(pH ~ Benches + (Sources * (Type + Species)) + 
                              (1|Benches:MainPlots),
                            data=na.omit(WaterRunoff.dat))
  TS.emm <- emmeans::emmeans(m1.lmer, specs = ~ Sources:Type)
  TS.preds <- summary(TS.emm)
  den.df <- min(TS.preds$df, na.rm = TRUE)
  ## Modify TS.preds to be compatible with a predictions.frame
  TS.preds <- as.predictions.frame(TS.preds, predictions = "emmean", 
                                   se = "SE", interval.type = "CI", 
                                   interval.names = c("lower.CL", "upper.CL"))
   
  ## Form an all.diffs object and check its validity
  TS.vcov <- vcov(TS.emm)
  TS.diffs <- allDifferences(predictions = TS.preds, 
                               classify = "Sources:Type", 
                               vcov = TS.vcov, tdf = den.df)
  validAlldiffs(TS.diffs)
}  

#Re-order predictions from asreml or lmerTest so all Sources for the same Type are together 
#for each combination of A and B
if (exists("TS.diffs"))
{
  TS.diffs.reord <- reorderClassify(TS.diffs, newclassify = "Type:Sources")
  validAlldiffs(TS.diffs.reord)
}



