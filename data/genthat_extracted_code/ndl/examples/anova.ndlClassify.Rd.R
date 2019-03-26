library(ndl)


### Name: anova.ndlClassify
### Title: Analysis of Model Fit for Naive Discriminatory Reader Models
### Aliases: anova.ndlClassify anova.ndlClassifylist
### Keywords: classif

### ** Examples


data(think)
set.seed(314)
think <- think[sample(1:nrow(think),500),]

think.ndl1 <- ndlClassify(Lexeme ~ Agent * Person, data=think)
anova(think.ndl1)

think.ndl2 <- ndlClassify(Lexeme ~ Agent * Person + Patient, data=think)
anova(think.ndl1, think.ndl2)




