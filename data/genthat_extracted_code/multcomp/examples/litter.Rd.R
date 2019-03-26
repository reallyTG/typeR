library(multcomp)


### Name: litter
### Title: Litter Weights Data Set
### Aliases: litter
### Keywords: datasets

### ** Examples


  ### fit ANCOVA model to data
  amod <- aov(weight ~ dose + gesttime + number, data = litter)

  ### define matrix of linear hypotheses for `dose'
  doselev <- as.integer(levels(litter$dose))
  K <- rbind(contrMat(table(litter$dose), "Tukey"),
             otrend = c(-1.5, -0.5, 0.5, 1.5),
             atrend = doselev - mean(doselev),
             ltrend = log(1:4) - mean(log(1:4)))

  ### set up multiple comparison object
  Kht <- glht(amod, linfct = mcp(dose = K), alternative = "less")

  ### cf. Westfall (1997, Table 2)
  summary(Kht, test = univariate())
  summary(Kht, test = adjusted("bonferroni"))
  summary(Kht, test = adjusted("Shaffer"))
  summary(Kht, test = adjusted("Westfall"))
  summary(Kht, test = adjusted("single-step"))




