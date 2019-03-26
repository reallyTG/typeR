library(RJDemetra)


### Name: plot
### Title: Plotting regarima, decomposition or final results of SA
### Aliases: plot plot.regarima plot.decomposition_X11
###   plot.decomposition_SEATS plot.final plot.SA

### ** Examples

## No test: 
myseries <- ipi_c_eu[, "FR"]
mysa <- x13_def(myseries, spec = c("RSA5c"))
 # RegArima
plot(mysa$regarima) # 6 graphics are plotted by default
# To only plot one graphic (here the residuals) changing the title:
plot(mysa$regarima, which = 1, caption = "Plot of residuals")
plot(mysa$regarima, which = 7) 

  # Decomposition
plot(mysa$decomposition) # To plot the S-I ratio
plot(mysa$decomposition, first_date = c(2010, 1)) # To start the plot in January 2010

  # Final
plot(mysa$final) # 2 graphics are plotted by default
# To only plot one graphic (here raw data, seasonal adjusted data and trend),
# changing the last date and the title
plot(mysa$final, last_date = c(2000, 1),
     caption = "Results", type_chart = "sa-trend")
## End(No test)



