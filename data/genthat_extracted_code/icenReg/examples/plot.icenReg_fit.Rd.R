library(icenReg)


### Name: plot.icenReg_fit
### Title: Plotting for icenReg Fits
### Aliases: plot.icenReg_fit

### ** Examples

 # Fitting mice data set
 data(miceData)
 miceFit <- ic_par(cbind(l, u) ~ grp, data = miceData) 
 
 # Creating covariates we want plotted
 newData <- data.frame(grp = c("ce", "ge"))
 # Naming rows for legend
 rownames(newData) <- c("Conventional", "Germ-Free")
 
 plot(miceFit, newdata = newData, 
      col = c('blue', 'orange'))



