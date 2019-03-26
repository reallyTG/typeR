library(digitalPCR)


### Name: digitalPCR
### Title: Estimate copy number and assay sensitivity from dPCR serial
###   dilution
### Aliases: digitalPCR

### ** Examples

#dilution at 1,2,4,8 fold
pos=c(221,97,39,14)
dilution=c(1,2,4,8)
neg=384-pos
#note in practice, set this 100 or larger
Nboot=10 

result1=digitalPCR(pos, neg, dilution,  Nboot)
print (paste(result1$"mean copy number", result1$"sd copy number"))
hist(result1$"thresholds",xlim=c(-2,10))

#the following example contains only 1 dilution
result2=digitalPCR(230, 355, 1,  Nboot, "TRUE")



