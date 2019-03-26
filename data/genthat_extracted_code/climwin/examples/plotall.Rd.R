library(climwin)


### Name: plotall
### Title: Visualise climate window data
### Aliases: plotall

### ** Examples


# Visualise a fixed climate window generated for dataframes Mass and MassClimate

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
           
plotall(dataset = MassOutput, bestmodel = single$bestmodel, 
       bestmodeldata = single$bestmodeldata,
       cw1 = 0.95, cw2 = 0.5, cw3 = 0.25, title = "Mass")
        
         



