library(cjoint)


### Name: japan2014conjoint
### Title: Japan 2014 Conjoint Experiment Dataset from Horiuchi et. al.
###   (2014)
### Aliases: japan2014conjoint
### Keywords: datasets

### ** Examples

data("japan2014conjoint")

# Run AMCE estimator using all attributes and uniform design
results <- amce(selected ~ `Consumption tax` + `Employment` + `Monetary and fiscal policy` + 
                  `Economic growth strategy` + `Nuclear power` + `TPP` + 
                  `Collective self-defense` + `Constitutional revision` + 
                  `National assembly seat reduction`,  data=japan2014conjoint, cluster=TRUE, 
                  respondent.id="respondentIndex", weights="wgt", design="uniform")



