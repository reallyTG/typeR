library(asremlPlus)


### Name: linTransform.alldiffs
### Title: Calculates a linear transformation of the predictions stored in
###   an 'alldiffs.object'.
### Aliases: linTransform.alldiffs linTransform
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
##D #Get additive predictions directly using predictPlus
##D diffs.sub <- predictPlus.asreml(classify = "Sources:Species", Vmatrix = TRUE, 
##D                                 linear.transformation = ~ Sources + Species,
##D                                 asreml.obj = current.asr, tables = "none", 
##D                                 wald.tab = current.asrt$wald.tab, 
##D                                 present = c("Type","Species","Sources"))
## End(Not run)

## Use lmeTest and emmmeans to get predictions and associated statistics

if (requireNamespace("lmerTest", quietly = TRUE) & 
    requireNamespace("emmeans", quietly = TRUE))
{
  m1.lmer <- lmerTest::lmer(pH ~ Benches + (Sources * Species) + 
                              (1|Benches:MainPlots),
                            data=na.omit(WaterRunoff.dat))
  SS.emm <- emmeans::emmeans(m1.lmer, specs = ~ Sources:Species)
  SS.preds <- summary(SS.emm)
  den.df <- min(SS.preds$df, na.rm = TRUE)
  ## Modify SS.preds to be compatible with a predictions.frame
  SS.preds <- as.predictions.frame(SS.preds, predictions = "emmean", 
                                   se = "SE", interval.type = "CI", 
                                   interval.names = c("lower.CL", "upper.CL"))
  
  ## Form an all.diffs object and check its validity
  SS.vcov <- vcov(SS.emm)
  SS.diffs <- allDifferences(predictions = SS.preds, classify = "Sources:Species", 
                             vcov = SS.vcov, tdf = den.df)
  validAlldiffs(SS.diffs)

  #Get additive predictions
  diffs.sub <- linTransform(SS.diffs, classify = "Sources:Species", 
                            linear.transformation = ~ Sources + Species,
                            Vmatrix = TRUE, tables = "none")
}  
 
##Calculate contrasts from prediction obtained using asreml or lmerTest 
if (exists("diffs.sub"))
{ 
  #Contrast matrix for differences between each species and non-planted for the last source
  L <- cbind(matrix(rep(0,7*32), nrow = 7, ncol = 32),
             diag(1, nrow = 7), 
             matrix(rep(-1, 7), ncol = 1))
  rownames(L) <- as.character(diffs.sub$predictions$Species[33:39])
  diffs.L <- linTransform(diffs.sub, 
                          classify = "Sources:Species",
                          linear.transformation = L,
                          tables = "predictions")
}



