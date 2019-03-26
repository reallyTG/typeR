library(apsimr)


### Name: plot.apsim
### Title: Visualize the Results of an APSIM Simulation
### Aliases: plot.apsim

### ** Examples

## Not run: 
##D apsimExe <-"C:/Program Files (x86)/Apsim75-r3008/Model/Apsim.exe"
##D apsimWd <- "~/APSIM"
##D toRun <- c("Centro.apsim", "Continuous Wheat.apsim")
##D results <- apsim(exe = apsimExe, wd = apsimWd, files = toRun)
##D 
##D #Look at all of the results as a function of time in seperate plots
##D plot(results[[2]])
##D 
##D #Put all variables on one faceted plot
##D plot(results[[2]], one_plot = TRUE) + theme_bw()
##D 
##D #Plot just yield as a function of time
##D plot(results[[2]], y = 'yield') + geom_line(colour = 'red') + theme_bw()
## End(Not run)



