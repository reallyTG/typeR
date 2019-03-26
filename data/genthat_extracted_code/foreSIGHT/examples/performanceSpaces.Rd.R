library(foreSIGHT)


### Name: performanceSpaces
### Title: performanceSpaces
### Aliases: performanceSpaces

### ** Examples

## Not run: 
##D data(tankSimpleScale)
##D 
##D # tank_simple_scenarios<-scenarioGenerator(obs=tank_obs,                     
##D #                           modelTag = modelTag,
##D #                           attPerturb=attPerturb,
##D #                           exSpArgs = exSpArgs)
##D 
##D # Example 1: Heat Map Example
##D systemArgs<-list(roofArea=100,
##D                  nPeople=1,
##D                  tankVol=2000,
##D                  firstFlush=1,
##D                  write.file=FALSE,
##D                  metric="reliability")
##D 
##D plotArgs=list(title="Scenario Neutral Space",
##D                legendtitle="Reliability",
##D                xlim=c(-2,2),
##D                ylim=c(0.7,1.3),
##D                performancelimits=c(0.6,0.85))
##D 
##D plot<-performanceSpaces(data=tank_simple_scenarios,
##D                         plotTag="Heat",
##D                         systemModel = tankWrapper,
##D                         systemArgs = systemArgs)
##D 
##D plot$plot
##D 
##D # Note options
##D # plotArgs$contour=FALSE
##D # plotArgs$lowfill="antiquewhite"   ###From supported R colour names
##D # plotArgs$highfill="#88CCEE"       ###Hexidecimal specification also okay
## End(Not run)

## Not run: 
##D #Example 2
##D result<-performanceSpaces(data=tank_simple_scenarios,
##D                           plotTag = "Contours",
##D                           plotArgs=plotArgs,
##D                           systemModel = tankWrapper,
##D                           systemArgs = systemArgs)
##D 
##D result$plot
## End(Not run)
#Example 3
## Not run: 
##D plotArgs$contourlevels=c(0.67,0.71)
##D 
##D result<-performanceSpaces(data=tank_simple_scenarios,
##D                           plotTag = "Contours",
##D                           plotArgs=plotArgs,
##D                           systemModel = tankWrapper,
##D                           systemArgs = systemArgs)
##D 
##D result$plot
## End(Not run)

## Not run: 
##D ###Example 4 - One-at-a-time/"OAT" plot
##D data(oatScenarios)
##D systemArgs=list(roofArea=50,
##D                  nPeople=1,
##D                  tankVol=3000,
##D                  firstFlush=1,
##D                  write.file=FALSE,
##D                  metric="reliability")
##D 
##D plotArgs=list(title="Scenario Neutral Space",
##D                legendtitle="Reliability",
##D                xlim=c(-2,2),
##D                ylim=c(0.7,1.3),
##D                performancelimits=c(0.6,0.85))
##D 
##D oat_plot=performanceSpaces(data=oat_out,
##D                            plotTag = "OAT",
##D                            plotArgs=plotArgs,
##D                            systemModel = tankWrapper,
##D                            systemArgs = systemArgs)
##D oat_plot
## End(Not run)



