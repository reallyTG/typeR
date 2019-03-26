library(difR)


### Name: difStd
### Title: Standardization DIF method
### Aliases: difStd plot.PDIF print.PDIF

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  verbal<-verbal[colnames(verbal) != "Anger"]
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  difStd(verbal, group = 25, focal.name = 1)
##D  difStd(verbal, group = "Gender", focal.name = 1)
##D  difStd(verbal[,1:24], group = verbal[,25], focal.name = 1)
##D 
##D  # With other weights
##D  difStd(verbal, group = "Gender", focal.name = 1, stdWeight = "reference")
##D  difStd(verbal, group = "Gender", focal.name = 1, stdWeight = "total")
##D  
##D  # With item purification
##D  difStd(verbal, group = "Gender", focal.name = 1, purify = TRUE)
##D  difStd(verbal, group = "Gender", focal.name = 1, purify = TRUE, nrIter = 5)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difStd(verbal, group = "Gender", focal.name = 1, anchor = 1:5)
##D  difStd(verbal, group = "Gender", focal.name = 1, anchor = 1:5, purify = TRUE)
##D 
##D 
##D  # With detection threshold of 0.05
##D  difStd(verbal, group = "Gender", focal.name = 1, thrSTD = 0.05)
##D 
##D  # Saving the output into the "STDresults.txt" file (and default path)
##D  r <- difStd(verbal, group = 25, focal.name = 1, save.output  =  TRUE, 
##D             output = c("STDresults","default"))
##D 
##D  # Graphical devices
##D  plot(r)
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


