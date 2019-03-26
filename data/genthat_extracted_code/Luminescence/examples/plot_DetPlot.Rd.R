library(Luminescence)


### Name: plot_DetPlot
### Title: Create De(t) plot
### Aliases: plot_DetPlot

### ** Examples


## Not run: 
##D ##load data
##D ##ExampleData.BINfileData contains two BINfileData objects
##D ##CWOSL.SAR.Data and TL.SAR.Data
##D data(ExampleData.BINfileData, envir = environment())
##D 
##D ##transform the values from the first position in a RLum.Analysis object
##D object <- Risoe.BINfileData2RLum.Analysis(CWOSL.SAR.Data, pos=1)
##D 
##D plot_DetPlot(object,
##D              signal.integral.min = 1,
##D              signal.integral.max = 3,
##D              background.integral.min = 900,
##D              background.integral.max = 1000,
##D              n.channels = 5,
##D )
## End(Not run)




