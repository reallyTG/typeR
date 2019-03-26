library(minque)


### Name: cot
### Title: Twenty four cotton genotypes with four agronomic traits
### Aliases: cot
### Keywords: datasets cotton lint yield lint percentage boll number lint
###   size linear mixed model minque resampling jackknife

### ** Examples

##Sample R codes used to analyze the data set: cot
 library(minque)
 data(cot)
 names(cot)
 cot$Geno=factor(cot$Geno)
 cot$Loc=factor(cot$LOC)
 cot$Rep=factor(cot$REP)

 res=lmm(LY~1|Geno*Loc+Loc:Rep,data=cot)
 res[[1]]$Var
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect

 res=lmm.jack(LY~1|Geno*Loc+Loc:Rep,data=cot,JacNum=10,JacRep=1,ALPHA=0.05)
 res[[1]]$Var
 res[[1]]$PVar
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect

 

 ##End



