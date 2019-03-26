library(difR)


### Name: selectDif
### Title: Selection of one of the DIF detection methods
### Aliases: selectDif

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
##D  # Calling Mantel-Haenszel 
##D  selectDif(verbal, group = 25, focal.name = 1, method = "MH")
##D 
##D  # Calling Mantel-Haenszel and saving output in 'MH.txt' file
##D  selectDif(verbal, group = 25, focal.name = 1, method = "MH", 
##D     save.output = TRUE, output = c("MH", "default"))
##D 
##D  # Calling Lord method
##D  # 2PL model, with item purification
##D  selectDif(verbal, group = 25, focal.name = 1, method = "Lord", model = "2PL", 
##D            purify = TRUE)
##D  
## End(Not run)
 


