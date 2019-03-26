library(popbio)


### Name: lnorms
### Title: Generate random lognormal values for fertility rates
### Aliases: lnorms
### Keywords: survey

### ** Examples

lnorms(1)

 # Generate lognormal random fertilities
 # for a population of 1000 mature individuals with mean fertility of
 # 3 and inter-individual variance in fertility of 1.5.
 
 rndfert  <- lnorms(1000, 3,1.5)
summary(rndfert)
 hist(rndfert,40, main="Lognormal random fertilities", 
xlab="Fertility rate", col="blue")


 


