library(difR)


### Name: difBD
### Title: Breslow-Day DIF method
### Aliases: difBD print.BD plot.BD

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
##D  difBD(verbal, group = 25, focal.name = 1)
##D  difBD(verbal, group = "Gender", focal.name = 1)
##D  difBD(verbal[,1:24], group = verbal[,25], focal.name = 1)
##D 
##D  # With the BD trend test statistic
##D  difBD(verbal, group = 25, focal.name = 1, BDstat = "trend")
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difBD(verbal, group = 25, focal.name = 1, p.adjust.method = "BH")
##D 
##D  # With item purification  
##D  difBD(verbal, group = "Gender", focal.name = 1, purify = TRUE)
##D  difBD(verbal, group = "Gender", focal.name = 1, purify = TRUE, nrIter = 5)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difBD(verbal, group = "Gender", focal.name = 1, anchor = 1:5)
##D  difBD(verbal, group = "Gender", focal.name = 1, anchor = 1:5, purify = TRUE)
##D 
##D  # Saving the output into the "BDresults.txt" file (and default path)
##D  r <- difBD(verbal, group = 25, focal.name = 1, save.output = TRUE, 
##D             output = c("BDresults","default"))
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
 


