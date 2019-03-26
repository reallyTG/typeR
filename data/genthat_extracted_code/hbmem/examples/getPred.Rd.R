library(hbmem)


### Name: getPred
### Title: Function getPred
### Aliases: getPred
### Keywords: internal

### ** Examples

library(hbmem)
sim=uvsdSim()
N=length(levels(as.factor(sim@cond[sim@Scond==0])))
I=length(levels(as.factor(sim@subj)))
J=length(levels(as.factor(sim@item)))
RN=sum(sim@Scond==0)

block=c(sim@muN,sim@alphaN,sim@betaN,0,0,-.001)

means=getPred(block,sim@cond[sim@Scond==0],sim@subj[sim@Scond==0],
sim@item[sim@Scond==0],sim@lag[sim@Scond==0],N,I,J,RN)

multi=sim@resp[sim@Scond==0] 

plot(multi~means,ylab="Response to New Item",xlab="Mean of New-Item Distribution")





