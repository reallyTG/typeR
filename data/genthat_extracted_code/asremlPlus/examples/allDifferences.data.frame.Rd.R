library(asremlPlus)


### Name: allDifferences.data.frame
### Title: Using supplied predictions and standard errors of pairwise
###   differences or the variance matrix of predictions, forms all pairwise
###   differences between the set of predictions, and p-values for the
###   differences.
### Aliases: allDifferences.data.frame allDifferences
### Keywords: asreml

### ** Examples

  data(Oats.dat)
  
  ## Use asreml to get predictions and associated statistics

  ## Not run: 
##D   m1.asr <- asreml(Yield ~ Nitrogen*Variety, 
##D                    random=~Blocks/Wplots,
##D                    data=Oats.dat)
##D   current.asrt <- asrtests(m1.asr)
##D   Var.pred <- asreml::predict.asreml(m1.asr, classify="Nitrogen:Variety", 
##D                                       sed=TRUE)
##D   if (getASRemlVersionLoaded(nchar = 1) == "3")
##D     Var.pred <- Var.pred$predictions
##D   Var.preds <- Var.pred$pvals
##D   Var.sed <- Var.pred$sed
##D   Var.vcov <- NULL
##D   wald.tab <-  current.asrt$wald.tab
##D   den.df <- wald.tab[match("Variety", rownames(wald.tab)), "denDF"]
##D   
## End(Not run)

  ## Use lmerTest and emmmeans to get predictions and associated statistics
  if (requireNamespace("lmerTest", quietly = TRUE) & 
      requireNamespace("emmeans", quietly = TRUE))
  {
    m1.lmer <- lmerTest::lmer(Yield ~ Nitrogen*Variety + (1|Blocks/Wplots),
                              data=Oats.dat)
    Var.emm <- emmeans::emmeans(m1.lmer, specs = ~ Nitrogen:Variety)
    Var.preds <- summary(Var.emm)
    den.df <- min(Var.preds$df)
    ## Modify Var.preds to be compatible with a predictions.frame
    Var.preds <- as.predictions.frame(Var.preds, predictions = "emmean", 
                                      se = "SE", interval.type = "CI", 
                                      interval.names = c("lower.CL", "upper.CL"))
    Var.vcov <- vcov(Var.emm)
    Var.sed <- NULL
  }

  ## Use the predictions obtained with either asreml or lmerTest
  if (exists("Var.preds"))
  {
    ## Order the Varieties in decreasing order for the predictions values in the 
    ## first N level 
    Var.diffs <- allDifferences(predictions = Var.preds, classify = "Nitrogen:Variety", 
                                sed = Var.sed, vcov = Var.vcov, tdf = den.df,
                                sortFactor = "Variety", decreasing = TRUE)
    print.alldiffs(Var.diffs, which="differences")
  
    ## Change the order of the factors in the alldiffs object and reorder components
    Var.reord.diffs <- allDifferences(predictions = Var.preds,
                                classify = "Variety:Nitrogen", 
                                sed = Var.sed, vcov = Var.vcov, tdf = den.df)
    print.alldiffs(Var.reord.diffs, which="predictions")
  }



