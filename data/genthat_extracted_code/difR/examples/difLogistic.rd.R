library(difR)


### Name: difLogistic
### Title: Logistic regression DIF method
### Aliases: difLogistic print.Logistic plot.Logistic

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  anger <- verbal[,colnames(verbal)=="Anger"]
##D  verbal <- verbal[,colnames(verbal)!="Anger"]
##D 
##D  # Testing both DIF effects simultaneously
##D  # Three equivalent settings of the data matrix and the group membership
##D  r <- difLogistic(verbal, group=25, focal.name = 1)
##D  difLogistic(verbal, group = "Gender", focal.name = 1)
##D  difLogistic(verbal[,1:24], group = verbal[,25], focal.name = 1)
##D 
##D  # Returning all covariance matrices of model parameters
##D  difLogistic(verbal, group=25, focal.name = 1, all.cov = TRUE)
##D 
##D  # Testing both DIF effects with the Wald test
##D  r2 <- difLogistic(verbal, group = 25, focal.name = 1, criterion = "Wald")
##D 
##D  # Testing nonuniform DIF effect
##D  difLogistic(verbal, group = 25, focal.name = 1, type = "nudif")
##D 
##D  # Testing uniform DIF effect
##D  difLogistic(verbal, group = 25, focal.name = 1, type = "udif")
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difLogistic(verbal, group=25, focal.name = 1, p.adjust.method = "BH")
##D 
##D  # With item purification
##D  difLogistic(verbal, group = "Gender", focal.name = 1, purify = TRUE)
##D  difLogistic(verbal, group = "Gender", focal.name = 1, purify = TRUE, nrIter = 5)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difLogistic(verbal, group = 25, focal.name = 1, anchor = 1:5)
##D 
##D  # Using anger trait score as the matching criterion
##D  difLogistic(verbal,group = 25, focal.name = 1,match = anger)
##D 
##D  # Using trait anger score as the group variable (i.e. testing
##D  # for DIF with respect to trait anger score)
##D  difLogistic(verbal[,1:24],group = anger,member.type = "cont")
##D 
##D  # Saving the output into the "Lresults.txt" file (and default path)
##D  r <- difLogistic(verbal, group = 25, focal.name = 1, save.output = TRUE, 
##D            output = c("Lresults", "default"))
##D 
##D  # Graphical devices
##D  plot(r)
##D  plot(r2)
##D  plot(r, plot = "itemCurve", item = 1)
##D  plot(r, plot = "itemCurve", item = 1, itemFit = "null")
##D  plot(r, plot = "itemCurve", item = 6)
##D  plot(r, plot = "itemCurve", item = 6, itemFit = "null")
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


