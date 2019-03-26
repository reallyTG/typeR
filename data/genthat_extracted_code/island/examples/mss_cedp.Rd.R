library(island)


### Name: mss_cedp
### Title: Likelihood approach for esitmating colonization/extinction with
###   perfect or imperfect detectability
### Aliases: mss_cedp
### Keywords: colonization, extinction likelihood, maximum

### ** Examples

## Not run: 
##D Data <- lakshadweepPLUS[[1]]
##D Guild_Tag = c("Alg", "Cor", "Mac", "Mic", "Omn", "Pis", "Zoo")
##D Time <- as.vector(c(2000, 2000, 2001, 2001, 2001, 2001, 2002, 2002, 2002, 
##D 2002, 2003, 2003, 2003, 2003, 2010, 2010, 2011, 2011, 2011, 2011, 2012, 
##D 2012, 2012, 2012, 2013, 2013, 2013, 2013))
##D R <- mss_cedp(Data, Time, Factor = 3, Tags = Guild_Tag, 
##D PerfectDetectability = FALSE, z = 4)
##D Guild_Tag = c("Agt", "Kad", "Kvt")
##D R <- mss_cedp(Data, Time, Factor = 2, Tags = Guild_Tag, 
##D PerfectDetectability = FALSE, z = 4)
## End(Not run)



