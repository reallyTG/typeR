library(asremlPlus)


### Name: recalcLSD.alldiffs
### Title: Adds or recalculates the LSD component of an 'alldiffs.object'.
### Aliases: recalcLSD.alldiffs recalcLSD
### Keywords: asreml

### ** Examples

data(WaterRunoff.dat)

##Use asreml to get predictions and associated statistics

## Not run: 
##D asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D current.asr <- asreml(fixed = pH ~ Benches + (Sources * (Type + Species)), 
##D                       random = ~ Benches:MainPlots,
##D                       keep.order=TRUE, data= WaterRunoff.dat)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D TS.diffs <- predictPlus(classify = "Sources:Type", 
##D                         asreml.obj = current.asr, 
##D                         wald.tab = current.asrt$wald.tab, 
##D                        present = c("Sources", "Type", "Species"))
## End(Not run)

## Use lmeTest and emmmeans to get predictions and associated statistics

if (requireNamespace("lmerTest", quietly = TRUE) & 
    requireNamespace("emmeans", quietly = TRUE))
{
  m1.lmer <- lmerTest::lmer(pH ~ Benches + (Sources * (Type + Species)) + 
                              (1|Benches:MainPlots),
                            data=na.omit(WaterRunoff.dat))
  TS.emm <- emmeans::emmeans(m1.lmer, specs = ~ Sources:Species)
  TS.preds <- summary(TS.emm)
  den.df <- min(TS.preds$df, na.rm = TRUE)
  ## Modify TS.preds to be compatible with a predictions.frame
  TS.preds <- as.predictions.frame(TS.preds, predictions = "emmean", 
                                   se = "SE", interval.type = "CI", 
                                   interval.names = c("lower.CL", "upper.CL"))
  
  ## Form an all.diffs object and check its validity
  TS.vcov <- vcov(TS.emm)
  TS.diffs <- allDifferences(predictions = TS.preds, classify = "Sources:Species", 
                             vcov = TS.vcov, tdf = den.df)
  validAlldiffs(TS.diffs)
}  

## Plot p-values for predictions obtained using asreml or lmerTest
if (exists("TS.diffs"))
{
  ##Recalculate the LSD values for predictions obtained using asreml or lmerTest  
  TS.diffs <- recalcLSD.alldiffs(TS.diffs, meanLSD.type = "factor.combinations", 
                                 LSDby = "Sources")
}



