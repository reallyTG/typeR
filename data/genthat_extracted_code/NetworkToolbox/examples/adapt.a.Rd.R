library(NetworkToolbox)


### Name: adapt.a
### Title: Adaptive Alpha
### Aliases: adapt.a

### ** Examples

#ANOVA
adapt.anova <- adapt.a(test = "anova", n = 200, alpha = .05, power = .80, groups = 3)

#Chi-square
adapt.chisq <- adapt.a(test = "chisq", n = 200, alpha = .05, power = .80, df = 3)

#Correlation
adapt.cor <- adapt.a(test = "cor", n = 200, alpha = .05, power = .80)

#One-sample t-test
adapt.one <- adapt.a(test = "one.sample", n = 200, alpha = .05, power = .80)

#Two-sample t-test
adapt.two <- adapt.a(test = "two.sample", n = 200, alpha = .05, power = .80)

#Paired sample t-test
adapt.paired <- adapt.a(test = "paired", n = 200, alpha = .05, power = .80, efxize = "medium")




