library(HSAUR)


### Name: smoking
### Title: Nicotine Gum and Smoking Cessation
### Aliases: smoking
### Keywords: datasets

### ** Examples


  data("smoking", package = "HSAUR")
  boxplot(smoking$qt/smoking$tt,
          smoking$qc/smoking$tc,
          names = c("Treated", "Control"), ylab = "Percent Quitters")




