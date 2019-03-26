library(asremlPlus)


### Name: sort.alldiffs
### Title: Sorts the components in an 'alldiffs.object' according to the
###   predicted values associated with a factor.
### Aliases: sort.alldiffs
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
##D   
##D #Use sort.alldiffs and save order for use with other response variables
##D TS.diffs.sort <- sort(diffs, sortFactor = "Sources", sortWithinVals = list(Type = "Control"))
##D sort.order <- attr(TS.diffs.sort, which = "sortOrder")
##D   
##D #Analyse Turbidity
##D m2.asr <- asreml(fixed = Turbidity ~ Benches + (Sources * (Type + Species)), 
##D                  random = ~ Benches:MainPlots,
##D                  keep.order=TRUE, data= WaterRunoff.dat)
##D current.asrt <- asrtests(m2.asr)
##D #Use pH sort.order to sort Turbidity alldiffs object
##D diffs2.sort <- predictPlus(m2.asr, classify = "Sources:Type", 
##D                            pairwise = FALSE, error.intervals = "Stand", 
##D                            tables = "none", present = c("Type","Species","Sources"),
##D                            sortFactor = "Sources", 
##D                            sortOrder = sort.order)
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
    
  #Use sort.alldiffs and save order for use with other response variables
  TS.diffs.sort <- sort(TS.diffs, sortFactor = "Sources", 
                        sortWithinVals = list(Type = "Control"))
  sort.order <- attr(TS.diffs.sort, which = "sortOrder")
  
  #Analyse Turbidity
  m2.lmer <- lmerTest::lmer(Turbidity ~ Benches + (Sources * (Type + Species)) + 
                              (1|Benches:MainPlots),
                            data=na.omit(WaterRunoff.dat))
  TS.emm <- emmeans::emmeans(m2.lmer, specs = ~ Sources:Type)
  TS.preds <- summary(TS.emm)
  den.df <- min(TS.preds$df, na.rm = TRUE)
  ## Modify TS.preds to be compatible with a predictions.frame
  TS.preds <- as.predictions.frame(TS.preds, predictions = "emmean", 
                                   se = "SE", interval.type = "CI", 
                                   interval.names = c("lower.CL", "upper.CL"))
    
  ## Form an all.diffs object, sorting it using the pH sort.order and check its validity
  TS.vcov <- vcov(TS.emm)
  TS.diffs2.sort <- allDifferences(predictions = TS.preds, 
                                   classify = "Sources:Type", 
                                   vcov = TS.vcov, tdf = den.df,
                                   sortFactor = "Sources", 
                                   sortOrder = sort.order)
  validAlldiffs(TS.diffs2.sort)
}  



