library(difR)


### Name: difGenLogistic
### Title: Generalized logistic regression DIF method
### Aliases: difGenLogistic print.genLogistic plot.genLogistic

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender ("Man" or "Woman") and
##D  # trait anger score ("Low" or "High")
##D  group <- rep("WomanLow", nrow(verbal))
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
##D  # Testing both types of DIF effects
##D  # Three equivalent settings of the data matrix and the group membership
##D  r <- difGenLogistic(Verbal, group = 25, focal.names = names)
##D  difGenLogistic(Verbal, group = "group", focal.name = names)
##D  difGenLogistic(Verbal[,1:24], group = Verbal[,25], focal.names = names)
##D 
##D  # Using the Wald test
##D  difGenLogistic(Verbal, group = 25, focal.names = names, criterion = "Wald")
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D difGenLogistic(Verbal, group = 25, focal.names = names, p.adjust.method = "BH")
##D 
##D  # With item purification
##D  difGenLogistic(Verbal, group = 25, focal.names = names, purify = TRUE)
##D  difGenLogistic(Verbal, group = 25, focal.names = names, purify = TRUE,
##D    nrIter = 5)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difGenLogistic(Verbal, group = 25, focal.name = names, anchor = 1:5)
##D 
##D  # Testing for nonuniform DIF effect
##D  difGenLogistic(Verbal, group = 25, focal.names = names, type = "nudif")
##D 
##D  # Testing for uniform DIF effect
##D  difGenLogistic(Verbal, group = 25, focal.names = names, type = "udif")
##D 
##D  # User anger trait score as matching criterion
##D  anger <- verbal[,25]
##D  difGenLogistic(Verbal, group = 25, focal.names = names, match = anger)
##D 
##D  # Saving the output into the "GLresults.txt" file (and default path)
##D  r <- difGenLogistic(Verbal, group = 25, focal.name = names, 
##D                 save.output = TRUE, output = c("GLresults","default"))
##D 
##D  # Graphical devices
##D  plot(r)
##D  plot(r, plot = "itemCurve", item = 1)
##D  plot(r, plot = "itemCurve", item = 1, itemFit = "best")
##D  plot(r, plot = "itemCurve", item = 6)
##D  plot(r, plot = "itemCurve", item = 6, itemFit = "best")
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


