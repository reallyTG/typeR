library(island)


### Name: upgma_model_selection
### Title: Model selection function based on a upgma grouping algorithm
### Aliases: upgma_model_selection
### Keywords: Akaike, colonization, detectability extinction, upgma,

### ** Examples

## Not run: 
##D Data <- lakshadweepPLUS[[1]]
##D Guild_Tag = c("Alg", "Cor", "Mac", "Mic", "Omn", "Pis", "Zoo")
##D Time <- as.vector(c(2000, 2000, 2001, 2001, 2001, 2001, 2002, 2002, 2002, 
##D 2002, 2003, 2003, 2003, 2003, 2010, 2010, 2011, 2011, 2011, 2011, 2012, 
##D 2012, 2012, 2012, 2013, 2013, 2013, 2013))
##D R <- upgma_model_selection(Data, Time, Factor = 3, Tags = Guild_Tag, 
##D PerfectDetectability = FALSE, z = 4)
##D Guild_Tag = c("Agt", "Kad", "Kvt")
##D R <- upgma_model_selection(Data, Time, Factor = 2, Tags = Guild_Tag, 
##D PerfectDetectability = FALSE, z = 4)
## End(Not run)



