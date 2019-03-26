library(glmmBUGS)


### Name: glmmBUGS
### Title: A function to run Generalised Linear Mixed Models in Bugs
### Aliases: glmmBUGS

### ** Examples
 
library(nlme)
data(Muscle)

muscleRagged = glmmBUGS(conc ~ length, data=Muscle, 
	effects="Strip", family="gaussian",
	modelFile='model.bug', reparam='Strip')
startingValues = muscleRagged$startingValues

## Not run: 
##D # run with winbugs
##D source("getInits.R")
##D require('R2WinBUGS')  
##D muscleResult = bugs(muscleRagged$ragged, getInits, 
##D 	parameters.to.save = names(getInits()),
##D 	model.file="model.bug", n.chain=3, n.iter=1000, 
##D 	n.burnin=100, n.thin=10, program="winbugs", 
##D 	working.directory=getwd()
##D ) 
##D 
##D # a jags example
##D require('R2jags')
##D muscleResultJags = jags(
##D muscleRagged$ragged, getInits, parameters.to.save = names(getInits()),
##D                 model.file="model.bug", n.chain=3, n.iter=1000, 
##D                 n.burnin=100, n.thin=10,
##D                 working.directory=getwd()) 
##D 
##D muscleParamsJags = restoreParams(
##D 	muscleResultJags$BUGSoutput, 
##D 	muscleRagged$ragged) 
##D checkChain(muscleParamsJags)
## End(Not run)

 
data(muscleResult)

muscleParams = restoreParams(muscleResult, muscleRagged$ragged)  
summaryChain(muscleParams)
checkChain(muscleParams)



# a spatial example
## Not run: 
##D library(diseasemapping)
##D 
##D data('popdata')
##D data('casedata')
##D 
##D model = getRates(casedata, popdata, ~age*sex)
##D ontario = getSMR(popdata, model, casedata)
##D ontario = ontario@data[,c("CSDUID","observed","logExpected")]
##D 
##D popDataAdjMat = spdep::poly2nb(popdata,
##D 	row.names=as.character(popdata[["CSDUID"]]))
##D 
##D data('popDataAdjMat')
##D data('ontario')
##D 
##D forBugs = glmmBUGS(formula=observed + logExpected ~ 1,
##D   effects="CSDUID",   family="poisson", spatial=popDataAdjMat,
##D   spatialEffect="CSDUID",
##D   data=ontario)
##D 
##D startingValues = forBugs$startingValues
##D 
##D source("getInits.R")
##D   # find patrick's OpenBUGS executable file
##D   if(Sys.info()['user'] =='patrick') {	 
##D     obExec = system(
##D       "find /store/patrick/ -name OpenBUGS",
##D     TRUE)
##D     obExec = obExec[length(obExec)]
##D   } else {
##D     obExec = NULL
##D   }
##D 
##D bugsResult = bugs(forBugs$ragged, getInits, 
##D   parameters.to.save = names(getInits()),
##D     model.file="model.bug", n.chain=3, n.iter=50, n.burnin=10, 
##D     n.thin=2,
##D       program="winbugs", debug=T,working.directory=getwd())
##D 
##D 
##D data('ontarioResult')
##D 
##D ontarioParams = restoreParams(ontarioResult, forBugs$ragged)
##D 
##D ontarioSummary = summaryChain(ontarioParams)
##D 
##D # posterior probability of having 10x excess risk
##D postProb = apply(ontarioParams$FittedRCSDUID, 3, function(x) mean(x>log(10)) )
##D hist(postProb)
##D 
##D 
##D ontario = mergeBugsData(popdata, ontarioSummary)
##D 
##D spplot(ontario, "FittedRateCSDUID.mean")
##D 
##D 
##D ontario = mergeBugsData(ontario, postProb, newcol="postProb", by.x="CSDUID")
##D spplot(ontario, "postProb")
##D 
##D 
##D 
## End(Not run)

# geostatistical example

## Not run: 
##D rongelap= read.table(url(
##D 	paste("http://www.leg.ufpr.br/lib/exe/fetch.php/",
##D 	"pessoais:paulojus:mbgbook:datasets:rongelap.txt",
##D 	sep="")
##D 	),header=TRUE
##D )
##D 
##D library('spdep')
##D coordinates(rongelap) = ~cX+cY
##D 
##D 
##D rongelap$logOffset = log(rongelap$time)
##D rongelap$site = seq(1, length(rongelap$time)) 
##D   
##D forBugs = glmmBUGS(
##D formula=counts + logOffset ~ 1, family="poisson",
##D     data=rongelap@data, effects="site", spatial=rongelap,
##D     priors=list(phisite="dgamma(100,1)"))
##D     
##D startingValues = forBugs$startingValues
##D startingValues$phi$site = 100
##D 
##D source("getInits.R")
##D 
##D rongelapResult = bugs(forBugs$ragged, getInits, 
##D   parameters.to.save = names(getInits()),
##D     model.file="model.bug", n.chain=2, n.iter=20, n.burnin=4, n.thin=2,
##D       program="winbugs", debug=TRUE,
##D       working.directory=getwd())
##D 
##D data('rongelapResult')
##D 
##D rongelapParams = restoreParams(rongelapResult, forBugs$ragged)      
##D       
##D checkChain(rongelapParams)
##D 
##D rongelapParams$siteGrid = CondSimuPosterior(rongelapParams, rongelap,
##D 	gridSize=100) 
##D 
##D rongelapSummary=summaryChain(rongelapParams)
##D 
##D # plot posterior probabilities of being above average
##D image(rongelapSummary$siteGrid$pgt0)
## End(Not run)




