library(BCEA)


### Name: ceef.plot
### Title: Cost-Effectiveness Efficiency Frontier (CEAF) plot
### Aliases: ceef.plot
### Keywords: Health economic evaluation Multiple comparisons

### ** Examples

### create the bcea object m for the smoking cessation example
data(Smoking)
m <- bcea(e,c,ref=4,Kmax=500,interventions=treats)
### produce the plot
ceef.plot(m,graph="base")
## No test: 
### tweak the options
ceef.plot(m,flip=TRUE,dominance=FALSE,start.from.origins=FALSE,
          print.summary=FALSE,graph="base")
### or use ggplot2 instead
if(require(ggplot2)){
ceef.plot(m,dominance=TRUE,start.from.origins=FALSE,pos=TRUE,
          print.summary=FALSE,graph="ggplot2")
}
## End(No test)



