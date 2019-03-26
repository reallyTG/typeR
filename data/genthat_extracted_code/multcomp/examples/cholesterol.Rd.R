library(multcomp)


### Name: cholesterol
### Title: Cholesterol Reduction Data Set
### Aliases: cholesterol
### Keywords: datasets

### ** Examples


  ### adjusted p-values for all-pairwise comparisons in a one-way layout 
  ### set up ANOVA model  
  amod <- aov(response ~ trt, data = cholesterol)

  ### set up multiple comparisons object for all-pair comparisons
  cht <- glht(amod, linfct = mcp(trt = "Tukey"))

  ### cf. Westfall et al. (1999, page 171)
  summary(cht, test = univariate())
  summary(cht, test = adjusted("Shaffer"))
  summary(cht, test = adjusted("Westfall"))

  ### use only a subset of all pairwise hypotheses
  K <- contrMat(table(cholesterol$trt), type="Tukey")
  Ksub <- rbind(K[c(1,2,5),],
                "D - test" = c(-1, -1, -1, 3, 0),
                "E - test" = c(-1, -1, -1, 0, 3))

  ### reproduce results in Westfall et al. (1999, page 172)
  ### note: the ordering of our estimates here is different
  amod <- aov(response ~ trt - 1, data = cholesterol)
  summary(glht(amod, linfct = mcp(trt = Ksub[,5:1])), 
          test = adjusted("Westfall"))



