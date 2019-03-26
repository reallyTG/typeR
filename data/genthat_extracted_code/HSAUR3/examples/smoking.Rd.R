library(HSAUR3)


### Name: smoking
### Title: Nicotine Gum and Smoking Cessation
### Aliases: smoking
### Keywords: datasets

### ** Examples


  data("smoking", package = "HSAUR3")
  boxplot(smoking$qt/smoking$tt,
          smoking$qc/smoking$tc,
          names = c("Treated", "Control"), ylab = "Percent Quitters")




