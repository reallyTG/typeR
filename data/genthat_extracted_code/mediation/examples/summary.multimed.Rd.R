library(mediation)


### Name: summary.multimed
### Title: Summarizing Output from Mediation Analysis with Multiple
###   Mechanisms
### Aliases: summary.multimed print.summary.multimed

### ** Examples


## Not run: 
##D 
##D # Replicates Figure 3 (right column) of Imai and Yamamoto (2012)
##D # Note: # of bootstrap samples set low for quick illustration
##D 
##D data(framing)
##D Xnames <- c("age", "educ", "gender", "income")
##D res <- multimed("immigr", "emo", "p_harm", "treat", Xnames, 
##D                data = framing, sims = 10)
##D summary(res)
##D plot(res, type = "point")
##D plot(res, type = c("sigma", "R2-total"), tgroup = "average")
##D 
## End(Not run)




