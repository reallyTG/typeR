library(RecordLinkage)


### Name: trainSupv
### Title: Train a Classifier
### Aliases: trainSupv
### Keywords: classif

### ** Examples

# Train a rpart decision tree with additional parameter minsplit
data(RLdata500)
pairs=compare.dedup(RLdata500, identity=identity.RLdata500,
                    blockfld=list(1,3,5,6,7))
model=trainSupv(pairs, method="rpart", minsplit=5)
summary(model)



