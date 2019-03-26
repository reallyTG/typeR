library(difR)


### Name: difMH
### Title: Mantel-Haenszel DIF method
### Aliases: difMH print.MH plot.MH

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
##D  r <- difMH(verbal, group = 25, focal.name = 1)
##D  difMH(verbal, group = "Gender", focal.name = 1)
##D  difMH(verbal[,1:24], group = verbal[,25], focal.name = 1)
##D 
##D  # With log odds-ratio statistic
##D  r2 <- difMH(verbal, group = 25, focal.name = 1, MHstat = "logOR")
##D 
##D  # With exact inference
##D  difMH(verbal, group = 25, focal.name = 1, exact = TRUE)
##D 
##D # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difMH(verbal, group = 25, focal.name = 1, p.adjust.method = "BH")
##D 
##D  # With item purification
##D  difMH(verbal, group = "Gender", focal.name = 1, purify = TRUE)
##D  difMH(verbal, group = "Gender", focal.name = 1, purify = TRUE, nrIter = 5)
##D 
##D  # Without continuity correction and with 0.01 significance level
##D  difMH(verbal, group = "Gender", focal.name = 1, alpha = 0.01, correct = FALSE)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difMH(verbal, group = "Gender", focal.name = 1, anchor = 1:5)
##D  difMH(verbal, group = "Gender", focal.name = 1, anchor = 1:5, purify = TRUE)
##D 
##D  # Saving the output into the "MHresults.txt" file (and default path)
##D  r <- difMH(verbal, group = 25, focal.name = 1, save.output = TRUE, 
##D             output = c("MHresults","default"))
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
 


