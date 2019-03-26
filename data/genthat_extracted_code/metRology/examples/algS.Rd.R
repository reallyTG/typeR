library(metRology)


### Name: algS
### Title: 'Algorithm S' - robust estimate of pooled standard deviation
### Aliases: algS
### Keywords: robust

### ** Examples

#example from ISO 5725-5:1998 (cell ranges for percent creosote)

cdiff <- c(0.28, 0.49, 0.40, 0.00, 0.35, 1.98, 0.80, 0.32, 0.95)

algS(cdiff, is.range=TRUE)
	

#Compare with the sd of the two values (based on the range)
c.sd <- cdiff/sqrt(2)
algS(c.sd, degfree=1, verbose=TRUE)





