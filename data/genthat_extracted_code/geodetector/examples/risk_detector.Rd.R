library(geodetector)


### Name: risk_detector
### Title: risk detector
### Aliases: risk_detector
### Keywords: detector risk

### ** Examples

data(CollectData)
risk_detector("incidence","soiltype",CollectData)
risk_detector(1,2,CollectData)
risk_detector(1,c(2,3,4),CollectData)
risk_detector("incidence",c("soiltype","watershed","elevation"),CollectData)



