library(mediation)


### Name: multimed
### Title: Estimation and Sensitivity Analysis for Multiple Causal
###   Mechanisms
### Aliases: multimed

### ** Examples


## Not run: 
##D 
##D # Replicates Figure 3 (right column) of Imai and Yamamoto (2012)
##D # Note: # of bootstrap samples set low for quick illustration
##D 
##D data(framing)
##D Xnames <- c("age", "educ", "gender", "income")
##D res <- multimed("immigr", "emo", "p_harm", "treat", Xnames, 
##D                data = framing, design = "single", sims = 10)
##D summary(res)
##D plot(res, type = "point")
##D plot(res, type = c("sigma", "R2-total"), tgroup = "average")
##D 
##D # Parallel design example using the simulated data of Imai, Tingley and Yamamoto (2012)
##D 
##D data(boundsdata)
##D res.para <- multimed(outcome = "out", med.main = "med", treat = "ttt", experiment = "manip",
##D 					 data = boundsdata, design = "parallel", sims = 10)
##D summary(res.para)
##D plot(res.para, tg = "av")
##D 
## End(Not run)




