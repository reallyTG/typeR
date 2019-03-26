library(qdap)


### Name: Search
### Title: Search Columns of a Data Frame
### Aliases: Search boolean_search %bs%

### ** Examples

## Not run: 
##D ## Dataframe search:
##D (SampDF <- data.frame("islands"=names(islands)[1:32],mtcars, row.names=NULL))
##D 
##D Search(SampDF, "Cuba", "islands")
##D Search(SampDF, "New", "islands")
##D Search(SampDF, "Ho")
##D Search(SampDF, "Ho", max.distance = 0)
##D Search(SampDF, "Axel Heiberg")
##D Search(SampDF, 19) #too much tolerance in max.distance
##D Search(SampDF, 19, max.distance = 0)
##D Search(SampDF, 19, "qsec", max.distance = 0)
##D 
##D ##Boolean search:
##D boolean_search(DATA$state, " I ORliar&&stinks")
##D boolean_search(DATA$state, " I &&.", values=TRUE)
##D boolean_search(DATA$state, " I OR.", values=TRUE)
##D boolean_search(DATA$state, " I &&.")
##D 
##D ## Exclusion:
##D boolean_search(DATA$state, " I ||.", values=TRUE)
##D boolean_search(DATA$state, " I ||.", exclude = c("way", "truth"), values=TRUE)
##D 
##D ## From stackoverflow: http://stackoverflow.com/q/19640562/1000343
##D dat <- data.frame(x = c("Doggy", "Hello", "Hi Dog", "Zebra"), y = 1:4)
##D z <- data.frame(z =c("Hello", "Dog"))
##D 
##D dat[boolean_search(dat$x, paste(z$z, collapse = "OR")), ]
##D 
##D ## Binary operator version
##D dat[dat$x %bs% paste(z$z, collapse = "OR"), ]
##D 
##D ## Passing to `trans_context`
##D inds <- boolean_search(DATA.SPLIT$state, " I&&.|| I&&!", ignore.case = FALSE)
##D with(DATA.SPLIT, trans_context(state, person, inds=inds))
##D 
##D (inds2 <- boolean_search(raj$dialogue, spaste(paste(negation.words, 
##D     collapse = " || "))))
##D trans_context(raj$dialogue, raj$person, inds2)
## End(Not run)



