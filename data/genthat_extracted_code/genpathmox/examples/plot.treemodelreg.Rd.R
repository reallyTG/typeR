library(genpathmox)


### Name: plot.treemodelreg
### Title: Comparative plot between nodes from or the Pathmox Segmentation
###   Trees: linear and LAD regression
### Aliases: plot.treemodelreg

### ** Examples

## Not run: 
##D ##example of LM in alumni satisfaction
##D 
##D data(fibtelereg)
##D 
##D segvar = fibtelereg[,2:11]
##D 
##D #select the variables
##D data.fib = fibtelereg[,12:18]
##D 
##D segvar$Age 		= factor(segvar$Age, ordered=T)
##D segvar$Salary 	= factor(segvar$Salary,
##D 	levels=c("<18k","25k","35k","45k",">45k"), ordered=T)
##D segvar$Accgrade = factor(segvar$Accgrade,
##D 	levels=c("accnote<7","7-8accnote","accnote>8"), ordered=T)
##D segvar$Grade 	= factor(segvar$Grade,
##D 	levels=c("<6.5note","6.5-7note","7-7.5note",">7.5note"), ordered=T)
##D 
##D #regression PATHMOX
##D fib.reg.pathmox = reg.pathmox(Satisfact~.,data=data.fib,segvar,
##D 	signif=0.05,deep=2,method="lm",size=0.15)
##D 
##D #terminal nodes comparison
##D fib.node.comp = reg.treemodel(fib.reg.pathmox)
##D 
##D  #Drawing the bar-plots
##D plot(fib.node.comp)
##D 
##D 
## End(Not run)

data(fibtelereg)

#identify the segmentation variables
segvar= fibtelereg[1:50,3:4]

#select the variables
data.fib=fibtelereg[1:50,12:18]

fib.reg.pathmox=reg.pathmox(Satisfact~.,data=data.fib,segvar,
		signif=0.05,deep=1,method="lm",size=0.15)

fib.node.comp=reg.treemodel(fib.reg.pathmox)

plot(fib.node.comp)



