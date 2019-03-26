library(beadarrayMSV)


### Name: makeDiploidCalls
### Title: Constrain calls to diploid representation
### Aliases: makeDiploidCalls

### ** Examples

#Construct tiny example data
calls <- c(0,.5,1,0,.25,.5,.5,.75,1,.5,.5,.5,0,.25,.75)
categories <- c('SNP','MSV-a','MSV-b','PSV','MSV-5')
calls <- matrix(calls,nrow=5,byrow=TRUE,
    dimnames=list(categories,paste('S',1:3,sep='')))
fData <- data.frame(Classification=categories,row.names=categories)
print(calls)

#Make diploid
diploidCalls <- makeDiploidCalls(calls, fData)
print(diploidCalls)



