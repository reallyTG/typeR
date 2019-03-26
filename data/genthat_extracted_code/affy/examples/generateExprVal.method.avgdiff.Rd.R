library(affy)


### Name: generateExprVal.method.avgdiff
### Title: Generate an expression value from the probes informations
### Aliases: generateExprVal.method.avgdiff
###   generateExprVal.method.medianpolish generateExprVal.method.liwong
###   generateExprVal.method.mas
### Keywords: manip

### ** Examples

  data(SpikeIn) ##SpikeIn is a ProbeSets
  probes <- pm(SpikeIn) 
  avgdiff <- generateExprVal.method.avgdiff(probes)
  medianpolish <- generateExprVal.method.medianpolish(probes)
  liwong <- generateExprVal.method.liwong(probes)
  playerout <- generateExprVal.method.playerout(probes)
  mas <- generateExprVal.method.mas(probes)
  
  concentrations <- as.numeric(sampleNames(SpikeIn))
  plot(concentrations,avgdiff$exprs,log="xy",ylim=c(50,10000),pch="a",type="b")
  points(concentrations,2^medianpolish$exprs,pch="m",col=2,type="b",lty=2)
  points(concentrations,liwong$exprs,pch="l",col=3,type="b",lty=3)
  points(concentrations,playerout$exprs,pch="p",col=4,type="b",lty=4)
  points(concentrations,mas$exprs,pch="p",col=4,type="b",lty=4)



