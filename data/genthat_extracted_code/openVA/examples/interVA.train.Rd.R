library(openVA)


### Name: interVA.train
### Title: Extended InterVA method for non-standard input
### Aliases: interVA.train
### Keywords: InterVA4

### ** Examples

## No test: 
data(RandomVA3)
test <- RandomVA3[1:200, ]
train <- RandomVA3[201:400, ]
out <- interVA.train(data = test, train = train, causes.train = "cause", 
                     prior = "train", type = "quantile")
## End(No test)



