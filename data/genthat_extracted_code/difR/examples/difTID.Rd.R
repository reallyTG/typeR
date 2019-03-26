library(difR)


### Name: difTID
### Title: Transformed Item Difficulties (TID) DIF method
### Aliases: difTID print.TID plot.TID

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
##D  r <- difTID(verbal, group = 25, focal.name = 1)
##D  difTID(verbal, group = "Gender", focal.name = 1)
##D  difTID(verbal[,1:24], group = verbal[,25], focal.name = 1)
##D 
##D  # With item purification and threshold 1
##D  r2 <- difTID(verbal, group = "Gender", focal.name = 1, purify = TRUE, thrTID = 1)
##D 
##D  # Saving the output into the "TIDresults.txt" file (and default path)
##D  difTID(verbal, group = 25, focal.name = 1, save.output = TRUE, 
##D    output = c("TIDresults", "default"))
##D 
##D  # Graphical devices
##D  plot(r2)
##D  plot(r2, plot = "delta")
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r2, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r2, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


