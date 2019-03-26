library(kwb.hantush)


### Name: hantushDistancesBaseProps
### Title: Hantush distances & base properties: allows input of vector of
###   x,y coordinates and also a vector for one of the base properties
### Aliases: hantushDistancesBaseProps

### ** Examples

baseProps <- baseProperties( time = 2^(0:6),
                             infiltrationRate = 1,
                             basinWidth = 10,
                             basinLength = 50,
                             horizConductivity = 10,
                             iniHead = 10,
                             specificYield = 0.2,
                             numberTimeSteps = 15)
res <- hantushDistancesBaseProps(baseProps = baseProps)
cols <- length(unique(res$dat[[res$changedBaseProp.Name]]))
mainTxt <- sprintf("Changed baseProperty: %s", res$changedBaseProp.Name)
xyplot(WLincrease ~ x,
       groups=res$dat[[res$changedBaseProp.Name]],
       data=res$dat,
       type="b",
       auto.key=list(columns=cols),
       main=mainTxt)



