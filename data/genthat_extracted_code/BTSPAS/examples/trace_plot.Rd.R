library(BTSPAS)


### Name: trace_plot
### Title: Creates trace plots of specified parameters showing the multiple
###   chains and the value of Rhat
### Aliases: trace_plot
### Keywords: ~models ~trace plot

### ** Examples
 
## Not run: 
##D # Create trace plots of the logitP parameters
##D # 
##D # extract the names of the variables from the MCMC object
##D varnames <- names(results$sims.array[1,1,]) 
##D # get the parms that start with logitP
##D parm.names <- varnames[grep("^logitP", varnames)] 
##D # create a pdf file of the plots
##D pdf(file="trace-logitP.pdf",sep=""))
##D trace_plot(title=title, results=results, 
##D     parms_to_plot=parm.names, panels=c(3,2))
##D dev.off()
##D 
##D # Or if you want an interactive display
##D par(ask=TRUE)
##D trace_plot(title=title, results=results, 
##D     parms_to_plot=parm.names, panels=c(2,1))
## End(Not run) 



