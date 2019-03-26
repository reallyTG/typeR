library(multcomp)


### Name: recovery
### Title: Recovery Time Data Set
### Aliases: recovery
### Keywords: datasets

### ** Examples


  ### set up one-way ANOVA
  amod <- aov(minutes ~ blanket, data = recovery)

  ### set up multiple comparisons: one-sided Dunnett contrasts
  rht <- glht(amod, linfct = mcp(blanket = "Dunnett"), 
              alternative = "less")

  ### cf. Westfall et al. (1999, p. 80)
  confint(rht, level = 0.9)

  ### the same
  rht <- glht(amod, linfct = mcp(blanket = c("b1 - b0 >= 0", 
                                             "b2 - b0 >= 0", 
                                             "b3 - b0 >= 0")))
  confint(rht, level = 0.9)




