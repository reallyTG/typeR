library(model4you)


### Name: predict.pmtree
### Title: pmtree predictions
### Aliases: predict.pmtree

### ** Examples



if(require("psychotools")) {
  data("MathExam14W", package = "psychotools")
  
  ## scale points achieved to [0, 100] percent
  MathExam14W$tests <- 100 * MathExam14W$tests/26
  MathExam14W$pcorrect <- 100 * MathExam14W$nsolved/13
  
  ## select variables to be used
  MathExam <- MathExam14W[ , c("pcorrect", "group", "tests", "study",
                               "attempt", "semester", "gender")]
  
  ## compute base model
  bmod_math <- lm(pcorrect ~ group, data = MathExam)
  lm_plot(bmod_math, densest = TRUE)
  
  ## compute tree
  (tr_math <- pmtree(bmod_math, control = ctree_control(maxdepth = 2)))
  plot(tr_math, terminal_panel = node_pmterminal(tr_math, plotfun = lm_plot, 
                                                 confint = FALSE))
  plot(tr_math, terminal_panel = node_pmterminal(tr_math, plotfun = lm_plot, 
                                                 densest = TRUE,
                                                 confint = TRUE))
  
  ## predict
  newdat <- MathExam[1:5, ]
  
  # terminal nodes
  (nodes <- predict(tr_math, type = "node", newdata = newdat))
  
  # response
  (pr <- predict(tr_math, type = "pass", newdata = newdat))
  
  # response including confidence intervals, see ?predict.lm
  (pr1 <- predict(tr_math, type = "pass", newdata = newdat,
                  predict_args = list(interval = "confidence")))
}



