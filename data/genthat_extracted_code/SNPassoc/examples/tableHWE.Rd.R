library(SNPassoc)


### Name: tableHWE
### Title: Test for Hardy-Weinberg Equilibrium
### Aliases: tableHWE print.tableHWE
### Keywords: utilities

### ** Examples

data(SNPs)
ans<-setupSNP(SNPs,6:40,sep="")
res<-tableHWE(ans)
print(res)
#change the significance level showed in the flag column
print(res,sig=0.001)


#stratified analysis
res<-tableHWE(ans,ans$sex)
print(res)





