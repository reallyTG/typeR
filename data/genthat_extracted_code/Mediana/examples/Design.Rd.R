library(Mediana)


### Name: Design
### Title: Design object
### Aliases: Design

### ** Examples

## Create DataModel object with a Design Object
data.model = DataModel() +
             Design(enroll.period = 9,
                    study.duration = 21,
                    enroll.dist = "UniformDist",
                    dropout.dist = "ExpoDist",
                    dropout.dist.par = parameters(rate = 0.0115))

## Create DataModel object with several Design Objects
design1 = Design(enroll.period = 9,
                 study.duration = 21,
                 enroll.dist = "UniformDist",
                 dropout.dist = "ExpoDist",
                 dropout.dist.par = parameters(rate = 0.0115))

design2 = Design(enroll.period   = 18,
                 study.duration = 24,
                 enroll.dist = "UniformDist",
                 dropout.dist = "ExpoDist",
                 dropout.dist.par = parameters(rate = 0.0115))

data.model = DataModel() +
             design1 +
             design2



