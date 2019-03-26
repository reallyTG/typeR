library(PST)


### Name: cmine
### Title: Mining contexts
### Aliases: cmine cmine,PSTf-method [,cprobd.list-method
###   [,cprobd.list,ANY,ANY,ANY-method plot,cprobd.list,ANY-method
### Keywords: methods

### ** Examples

## Loading the SRH.seq sequence object
data(SRH)

## Learning the model
SRH.pst <- pstree(SRH.seq, nmin=30, ymin=0.001)

## Example 1: searching for all contexts yielding a probability of the 
## state G1 (very good health) of at least pmin=0.5
cm1 <- cmine(SRH.pst, pmin=0.5, state="G1")
cm1[1:10]

## Example 2: contexts associated with a high probability of 
## medium or lower self rated health 
cm2 <- cmine(SRH.pst, pmin=0.5, state=c("B1", "B2", "M"))
plot(cm2, tlim=0, main="(a) p(B1,B2,M)>0.5")



