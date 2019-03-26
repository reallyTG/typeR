library(difR)


### Name: difGMH
### Title: Generalized Mantel-Haenszel DIF method
### Aliases: difGMH print.GMH plot.GMH

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender ("Man" or "Woman") and
##D  # trait anger score ("Low" or "High")
##D  group <- rep("WomanLow",nrow(verbal))
##D  group[Anger>20 & Gender==0] <- "WomanHigh"
##D  group[Anger<=20 & Gender==1] <- "ManLow"
##D  group[Anger>20 & Gender==1] <- "ManHigh"
##D 
##D  # New data set
##D  Verbal <- cbind(verbal[,1:24], group)
##D 
##D  # Reference group: "WomanLow"
##D  names <- c("WomanHigh", "ManLow", "ManHigh")
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  difGMH(Verbal, group = 25, focal.names = names)
##D  difGMH(Verbal, group = "group", focal.name = names)
##D  difGMH(Verbal[,1:24], group = Verbal[,25], focal.names = names)
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difGMH(Verbal, group = 25, focal.names = names, p.adjust.method = "BH")
##D 
##D  # With item purification 
##D  difGMH(Verbal, group = 25, focal.names = names, purify = TRUE)
##D  difGMH(Verbal, group = 25, focal.names = names, purify = TRUE, nrIter = 5)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difMH(Verbal, group = 25, focal.name = names, anchor = 1:5)
##D  difMH(Verbal, group = 25, focal.name = names, anchor = 1:5, purify = TRUE)
##D 
##D 
##D  # Saving the output into the "GMHresults.txt" file (and default path)
##D  r <- difGMH(Verbal, group = 25, focal.name = names, save.output = TRUE, 
##D             output = c("GMHresults","default"))
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



