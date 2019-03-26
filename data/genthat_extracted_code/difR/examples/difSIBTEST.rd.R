library(difR)


### Name: difSIBTEST
### Title: SIBTEST and Crossing-SIBTEST DIF method
### Aliases: difSIBTEST print.SIBTEST plot.SIBTEST

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  verbal <- verbal[colnames(verbal) != "Anger"]
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  r <- difSIBTEST(verbal, group = 25, focal.name = 1)
##D  difSIBTEST(verbal, group = "Gender", focal.name = 1)
##D  difSIBTEST(verbal[,1:24], group = verbal[,25], focal.name = 1)
##D 
##D  # Test for nonuniform DIF
##D  difSIBTEST(verbal, group = 25, focal.name = 1, type = "nudif")
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difSIBTEST(verbal, group = 25, focal.name = 1, p.adjust.method = "BH")
##D 
##D  # With item purification
##D  difSIBTEST(verbal, group = 25, focal.name = 1, purify = TRUE)
##D  r2 <- difSIBTEST(verbal, group = 25, focal.name = 1, purify = TRUE, nrIter = 5)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difSIBTEST(verbal, group = "Gender", focal.name = 1, anchor = 1:5)
##D  difSIBTEST(verbal, group = "Gender", focal.name = 1, anchor = 1:5, purify = TRUE)
##D 
##D  # Saving the output into the "SIBresults.txt" file (and default path)
##D  r <- difSIBTEST(verbal, group = 25, focal.name = 1, save.output = TRUE,
##D             output = c("SIBresults","default"))
##D 
##D  # Graphical devices
##D  plot(r)
##D  plot(r2)
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


