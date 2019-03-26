library(qdap)


### Name: gantt_rep
### Title: Generate Unit Spans for Repeated Measures
### Aliases: gantt_rep
### Keywords: Gantt

### ** Examples

## Not run: 
##D dat <- with(rajSPLIT, gantt_rep(act, dialogue, list(fam.aff, sex),
##D     units = "words", col.sep = "_"))
##D head(dat, 20)
##D plot(dat)
##D 
##D gantt_wrap(dat,  "fam.aff_sex",  facet.vars = "act",
##D     title = "Repeated Measures Gantt Plot",
##D     minor.line.freq = 25, major.line.freq = 100)
##D 
##D ## Two facets variables
##D dat2 <- with(DATA2, gantt_rep(list(day, class), state, person,
##D     units = "words", col.sep = "_"))
##D head(dat2, 20)
##D plot(dat2)
## End(Not run)



