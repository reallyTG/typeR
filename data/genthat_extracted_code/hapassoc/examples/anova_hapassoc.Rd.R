library(hapassoc)


### Name: anova.hapassoc
### Title: Return likelihood ratio test of haplotype effect
### Aliases: anova.hapassoc
### Keywords: methods

### ** Examples

data(hypoDatGeno)
example2.pre.hapassoc<-pre.hapassoc(hypoDatGeno, numSNPs=3, allelic=FALSE)
example2.regr <- hapassoc(affected ~ attr + hAAA+ hACA + hACC + hCAA + 
pooled, example2.pre.hapassoc, family=binomial())
example2.regr2 <- hapassoc(affected ~ attr + hAAA, example2.pre.hapassoc, 
family=binomial())
anova(example2.regr,example2.regr2)

# Returns:

#	hapassoc: likelihood ratio test

#Full model: affected ~ attr + hAAA + hACA + hACC + hCAA + pooled 
#Reduced model: affected ~ attr + hAAA 

#LR statistic = 1.5433 , df = 4 , p-value =  0.8189 



