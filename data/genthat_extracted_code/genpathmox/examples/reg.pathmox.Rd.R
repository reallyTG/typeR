library(genpathmox)


### Name: reg.pathmox
### Title: PATHMOX-REG: Segmentation Trees in linaer and LAD regression
###   model
### Aliases: reg.pathmox

### ** Examples

## Not run: 
##D ##example of LM in alumni satisfaction
##D 
##D data(fibtelereg)
##D 
##D #identify the segmentation variables
##D segvar = fibtelereg[,2:11]
##D 
##D #select the variables
##D data.fib = fibtelereg[,12:18]
##D 
##D #re-ordering those segmentation variables with ordinal scale
##D segvar$Age     = factor(segvar$Age, ordered=T)
##D segvar$Salary   = factor(segvar$Salary,
##D 		levels=c("<18k","25k","35k","45k",">45k"), ordered=T)
##D segvar$Accgrade = factor(segvar$Accgrade,
##D 		levels=c("accnote<7","7-8accnote","accnote>8"), ordered=T)
##D segvar$Grade 	= factor(segvar$Grade,
##D 		levels=c("<6.5note","6.5-7note","7-7.5note",">7.5note"), ordered=T)
##D 
##D #regression PATHMOX
##D fib.reg.pathmox = reg.pathmox(Satisfact~.,data=data.fib,segvar,
##D 		signif=0.05,deep=2,method="lm",size=0.15)
##D 
## End(Not run)

data(fibtelereg)

#identify the segmentation variables
segvar= fibtelereg[1:50,3:4]

#select the variables
data.fib=fibtelereg[1:50,12:18]

fib.reg.pathmox=reg.pathmox(Satisfact~.,data=data.fib,segvar,
		signif=0.05,deep=1,method="lm",size=0.15)



