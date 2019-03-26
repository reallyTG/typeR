library(asremlPlus)


### Name: plotPvalues.data.frame
### Title: Plots a heat map of p-values for pairwise differences between
###   predictions.
### Aliases: plotPvalues.data.frame
### Keywords: hplot dplot asreml

### ** Examples

data(WaterRunoff.dat)

##Use asreml to get predictions and associated statistics

## Not run: 
##D asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D current.asr <- asreml(fixed = pH ~ Benches + (Sources * (Type + Species)), 
##D                       random = ~ Benches:MainPlots,
##D                       keep.order=TRUE, data= WaterRunoff.dat))
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D SS.diffs <- predictPlus.asreml(classify = "Sources:Type", 
##D                                asreml.obj = current.asr, tables = "none", 
##D                                wald.tab = current.asrt$wald.tab, 
##D                                present = c("Type","Species","Sources"))
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
  p <- within(reshape::melt(TS.diffs$p.differences), 
              { 
                X1 <- factor(X1, levels=dimnames(TS.diffs$p.differences)[[1]])
                X2 <- factor(X2, levels=levels(X1))
              })
  names(p)[match("value", names(p))] <- "p"
  plotPvalues(p, x = "X1", y = "X2", 
              gridspacing = rep(c(3,4), c(4,2)), show.sig = TRUE)
}



