library(difR)


### Name: genDichoDif
### Title: Comparison of DIF detection methods among multiple groups
### Aliases: genDichoDif print.genDichoDif

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
##D  # Comparing the three available methods
##D  # with item purification 
##D  genDichoDif(Verbal, group = 25, focal.names = names, method = c("GMH", "genLogistic",
##D              "genLord"), purify = TRUE)
##D    
##D  # Same analysis, but saving the output into the 'genDicho' file
##D  genDichoDif(Verbal, group = 25, focal.names = names, method = c("GMH", "genLogistic", 
##D              "genLord"), purify = TRUE, save.output = TRUE, 
##D              output = c("genDicho", "default"))
## End(Not run)



