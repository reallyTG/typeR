library(psych)


### Name: cushny
### Title: A data set from Cushny and Peebles (1905) on the effect of three
###   drugs on hours of sleep, used by Student (1908)
### Aliases: cushny
### Keywords: datasets

### ** Examples

data(cushny)
with(cushny, t.test(drug1,drug2L,paired=TRUE)) #within subjects 

error.bars(cushny[1:4],within=TRUE,ylab="Hours of sleep",xlab="Drug condition", 
       main="95% confidence of within subject effects")



