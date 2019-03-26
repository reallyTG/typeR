library(multcomp)


### Name: detergent
### Title: Detergent Durability Data Set
### Aliases: detergent
### Keywords: datasets

### ** Examples


  ### set up two-way ANOVA without interactions
  amod <- aov(plates ~ block + detergent, data = detergent)

  ### set up all-pair comparisons
  dht <- glht(amod, linfct = mcp(detergent = "Tukey"))

  ### see Westfall et al. (1999, p. 190)
  confint(dht)

  ### see Westfall et al. (1999, p. 192)
  summary(dht, test = univariate())
  summary(dht, test = adjusted("Shaffer"))
  summary(dht, test = adjusted("Westfall"))




