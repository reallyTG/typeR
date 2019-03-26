library(weightTAPSPACK)


### Name: weightTAPS
### Title: Subset TAPS data and find weights
### Aliases: weightTAPS weightTAPS,ANY-method

### ** Examples

myOutcome <- c("APPRCONGS2","APPRCONGS6")
myCovars <- c("POLKNOW3S2","POLKNOW6S2")
test<-weightTAPS(interact=FALSE,outcome=myOutcome,
    covars=myCovars,weight=FALSE,refusedasNA=TRUE,
    method="hotdeck",m=5,pop.base=1,trunc_at=5,stringsAsFactors=TRUE)



