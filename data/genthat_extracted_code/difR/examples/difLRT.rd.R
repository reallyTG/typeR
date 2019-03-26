library(difR)


### Name: difLRT
### Title: Likelihood-Ratio Test DIF method
### Aliases: difLRT print.LRT plot.LRT

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  verbal <- verbal[colnames(verbal)!="Anger"]
##D 
##D  # Keeping the first 5 items and the first 50 subjects
##D  # (this is an artificial simplification to reduce the computational time)
##D  verbal <- verbal[1:50, c(1:5, 25)]
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  r <- difLRT(verbal, group = 6, focal.name = 1)
##D  difLRT(verbal, group = "Gender", focal.name = 1)
##D  difLRT(verbal[,1:5], group = verbal[,6], focal.name = 1)
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difLRT(verbal, group = 6, focal.name = 1, p.adjust.method = "BH")
##D 
##D  # With item purification
##D  difLRT(verbal, group = 6, focal.name = 1, purify = TRUE)
##D 
##D  # Saving the output into the "LRTresults.txt" file (and default path)
##D  r <- difLRT(verbal, group = 6, focal.name = 1, save.output = TRUE, 
##D             output = c("LRTresults", "default"))
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
##D 
##D  # WARNING: do not trust the results above since they are based on a selected 
##D  # subset of the verbal data set!
##D  
## End(Not run)
 


