library(asremlPlus)


### Name: is.alldiffs
### Title: Tests whether an object is of class alldiffs
### Aliases: is.alldiffs
### Keywords: manip

### ** Examples

  data(Oats.dat)
  
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

  ## Form an all.diffs object
   Var.diffs <- as.alldiffs(predictions = Var.preds, classify = "Nitrogen:Variety", 
                            sed = Var.sed, vcov = Var.vcov, tdf = den.df)

  ## check the class of Var.diffs
  is.alldiffs(Var.diffs)
  }



