library(RecordLinkage)


### Name: classifySupv
### Title: Supervised Classification
### Aliases: classifySupv classifySupv-methods
###   classifySupv,RecLinkClassif,RecLinkData-method
###   classifySupv,RecLinkClassif,RLBigData-method
### Keywords: classif

### ** Examples

# Split data into training and validation set, train and classify with rpart
data(RLdata500)
pairs=compare.dedup(RLdata500, identity=identity.RLdata500,
                    blockfld=list(1,3,5,6,7))
l=splitData(pairs, prop=0.5, keep.mprop=TRUE)                    
model=trainSupv(l$train, method="rpart", minsplit=5)
result=classifySupv(model=model, newdata=l$valid)
summary(result)




