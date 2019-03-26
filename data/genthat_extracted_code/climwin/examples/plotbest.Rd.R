library(climwin)


### Name: plotbest
### Title: Visualise the best climate window
### Aliases: plotbest

### ** Examples

# Visualise the best climate window from the datasets Mass and MassClimate

data(MassOutput)
data(Mass)
data(MassClimate)

single <- singlewin(xvar = list(Temp = MassClimate$Temp), 
                   cdate = MassClimate$Date, bdate = Mass$Date, 
                   baseline = lm(Mass ~ 1, data = Mass),
                   range = c(72, 15), 
                   stat = "mean", func = "lin", 
                   type = "absolute", refday = c(20, 5), 
                   cmissing = FALSE, cinterval = "day")
           
plotbest(dataset = MassOutput, bestmodel = single$BestModel,
        bestmodeldata = single$BestModelData)
             



