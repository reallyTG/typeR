library(qdap)


### Name: multiscale
### Title: Nested Standardization
### Aliases: multiscale
### Keywords: scale

### ** Examples

## Not run: 
##D dat <- with(mraja1spl, word_stats(dialogue, list(person, sex, fam.aff)))
##D htruncdf(colsplit2df(dat$ts), ,4)
##D out1 <- with(colsplit2df(dat$ts), multiscale(word.count, person))
##D ltruncdf(out1, 10)
##D out2 <- with(colsplit2df(dat$ts), multiscale(word.count, 
##D     list(fam.aff, sex)))
##D ltruncdf(out2, 10)
##D out3 <- with(colsplit2df(dat$ts), multiscale(word.count, 
##D     list(fam.aff, sex), original_order = FALSE))
##D ltruncdf(out3, 10)
## End(Not run)



