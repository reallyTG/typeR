library(difR)


### Name: dichoDif
### Title: Comparison of DIF detection methods
### Aliases: dichoDif print.dichoDif

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
##D  # Comparing TID, Mantel-Haenszel, standardization; logistic regression and SIBTEST
##D  # TID threshold 1.0
##D  # Standardization threshold 0.08
##D  # no continuity correction,
##D  # with item purification
##D  # both types of DIF effect for logistic regression
##D  # CSIBTEST method 
##D  dichoDif(verbal, group = 25, focal.name = 1, method = c("TID", "MH", "Std",
##D           "Logistic", "SIBTEST"), correct = FALSE, thrSTD = 0.08, thrTID = 1, purify = TRUE)
##D 
##D  # Same analysis, but using items 1 to 5 as anchor and saving the output into 
##D  # the 'dicho' file 
##D  dichoDif(verbal, group = 25, focal.name = 1, method = c("TID", "MH", "Std",
##D           "Logistic"), correct = FALSE, thrSTD = 0.08, thrTID = 1, purify = TRUE, 
##D           anchor = 1:5,save.output = TRUE, output = c("dicho", "default"))
##D 
##D  # Comparing Lord and Raju results with 2PL model and
##D  # with item purification 
##D  dichoDif(verbal, group = 25, focal.name = 1, method = c("Lord", "Raju"),
##D           model = "2PL", purify = TRUE)
## End(Not run)
 


