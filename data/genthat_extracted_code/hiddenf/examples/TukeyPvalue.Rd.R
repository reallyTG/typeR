library(hiddenf)


### Name: TukeyPvalue
### Title: Tukey's single degree of freedom test for nonadditivity
### Aliases: TukeyPvalue
### Keywords: non-additivity

### ** Examples

library(hiddenf)
data(cjejuni.mtx)
cjejuni.out <- HiddenF(cjejuni.mtx)
tukey.pvalue <- TukeyPvalue(cjejuni.out)



