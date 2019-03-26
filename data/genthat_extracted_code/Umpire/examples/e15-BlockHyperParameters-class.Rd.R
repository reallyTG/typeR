library(Umpire)


### Name: BlockHyperParameters-class
### Title: The "BlockHyperParameters" Class
### Aliases: BlockHyperParameters-class BlockHyperParameters
###   makeBlockStructure
### Keywords: classes datagen

### ** Examples

showClass("BlockHyperParameters")
sm <- SurvivalModel(baseHazard=1/3, units=52, unitName="weeks")
cm <- CancerModel("myModel", nPossible=10, nPattern=5,
                  survivalModel=sm)
hyper <- BlockHyperParameters()
engine <- makeBlockStructure(cm, hyper)
outcome <- rand(engine, 100)
summary(outcome$clinical)
dim(outcome$data)



