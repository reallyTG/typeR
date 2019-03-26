library(hiddenf)


### Name: KKSAPvalue
### Title: Kharrati-Kopaei and Sadooghi-Alvandi's test for non-additivity
### Aliases: KKSAPvalue
### Keywords: non-additivity

### ** Examples

library(hiddenf)
data(cjejuni.mtx)
cjejuni.out <- HiddenF(cjejuni.mtx)
KKSA.out <- KKSAPvalue(cjejuni.out)
print(KKSA.out$pvalue)



