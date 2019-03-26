library(difR)


### Name: selectGenDif
### Title: Selection of one of the DIF detection methods among multiple
###   groups
### Aliases: selectGenDif

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender ("Man" or "Woman") and trait
##D  # anger score ("Low" or "High")
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
##D  # Calling generalized Mantel-Haenszel
##D  selectGenDif(Verbal, group = 25, focal.names = names, method = "GMH")
##D 
##D  # Calling generalized Mantel-Haenszel and saving output in 'GMH.txt' file
##D  selectGenDif(Verbal, group = 25, focal.name = names, method = "GMH", 
##D               save.output = TRUE, output = c("GMH", "default"))
##D 
##D  # Calling generalized logistic regression
##D  selectGenDif(Verbal, group = 25, focal.names = names, method = "genLogistic")
##D 
##D  # Calling generalized Lord method (2PL model)
##D  selectGenDif(Verbal, group = 25, focal.names = names, method = "genLord", 
##D               model = "2PL")
##D   
## End(Not run)



