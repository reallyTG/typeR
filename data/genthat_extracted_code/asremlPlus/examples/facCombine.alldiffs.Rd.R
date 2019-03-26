library(asremlPlus)


### Name: facCombine.alldiffs
### Title: Combines several factors into one in the components of an
###   'alldiffs.object'
### Aliases: facCombine.alldiffs facCombine
### Keywords: asreml factor manip

### ** Examples

  data("Ladybird.dat")
  
  ## Use asreml to get predictions and associated statistics

  ## Not run: 
##D   m1.asr <- asreml(logitP ~ Host*Cadavers*Ladybird, 
##D                    random = ~ Run,
##D                    data = Ladybird.dat)
##D   current.asrt <- asrtests(m1.asr)
##D   HCL.pred <- asreml::predict.asreml(m1.asr, classify="Host:Cadavers:Ladybird", 
##D                                      sed=TRUE)
##D   HCL.preds <- HCL.pred$pvals
##D   HCL.sed <- HCL.pred$sed
##D   HCL.vcov <- NULL
##D   wald.tab <-  current.asrt$wald.tab
##D   den.df <- wald.tab[match("Host:Cadavers:Ladybird", rownames(wald.tab)), "denDF"]
##D   
## End(Not run)
  
  ## Use lmeTest and emmmeans to get predictions and associated statistics
  if (requireNamespace("lmerTest", quietly = TRUE) & 
      requireNamespace("emmeans", quietly = TRUE))
  {
    m1.lmer <- lmerTest::lmer(logitP ~ Host*Cadavers*Ladybird + (1|Run),
                              data=Ladybird.dat)
    HCL.emm <- emmeans::emmeans(m1.lmer, specs = ~ Host:Cadavers:Ladybird)
    HCL.preds <- summary(HCL.emm)
    den.df <- min(HCL.preds$df)
    ## Modify HCL.preds to be compatible with a predictions.frame
    HCL.preds <- as.predictions.frame(HCL.preds, predictions = "emmean", 
                                      se = "SE", interval.type = "CI", 
                                      interval.names = c("lower.CL", "upper.CL"))
    HCL.vcov <- vcov(HCL.emm)
    HCL.sed <- NULL
  }
  
  ## Use the predictions obtained with either asreml or lmerTest
  if (exists("HCL.preds"))
  {
    ## Form an all.diffs object
    HCL.diffs <- as.alldiffs(predictions = HCL.preds, classify = "Host:Cadavers:Ladybird", 
                             sed = HCL.sed, vcov = HCL.vcov, tdf = den.df)
    
    ## Check the class and validity of the alldiffs object
    is.alldiffs(HCL.diffs)
    validAlldiffs(HCL.diffs)

    ## Combine Cadavers and Ladybird
    HCL.diffs <- facCombine(HCL.diffs, factors = c("Cadavers","Ladybird"))
    
    ## Check the validity of HCL.diffs
    validAlldiffs(HCL.diffs)
  }



