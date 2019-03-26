library(qdap)


### Name: exclude
### Title: Exclude Elements From a Vector
### Aliases: exclude exclude.TermDocumentMatrix exclude.DocumentTermMatrix
###   exclude.wfm exclude.list exclude.default %ex%

### ** Examples

## Not run: 
##D exclude(1:10, 3, 4)
##D exclude(1:10, 3:4)
##D Top25Words
##D exclude(Top25Words, qcv(the, of, and))
##D exclude(Top25Words, "the", "of", "an")
##D 
##D #Using with term_match and termco 
##D terms <- term_match(DATA$state, qcv(th), FALSE) 
##D exclude(terms, "truth")  
##D #all together
##D termco(DATA$state, DATA$person, exclude(term_match(DATA$state, qcv(th), 
##D     FALSE), "truth"))
##D 
##D MTCH.LST <- exclude(term_match(DATA$state, qcv(th, i)), qcv(truth, stinks))
##D termco(DATA$state, DATA$person, MTCH.LST)
##D 
##D ## Works with wfm
##D dat <- wfm(DATA$state, DATA$person)
##D the.no <- term_match(DATA$state, c("the", "no"))
##D exclude(dat, unlist(the.no))
##D 
##D ## Works with tm's TermDocumentMatrix/DocumentTermMatrix
##D dat2 <- as.dtm(DATA$state, DATA$person)
##D out.dtm <- exclude(dat2, unlist(the.no))
##D tm::inspect(out.dtm)
##D 
##D dat3 <- as.tdm(DATA$state, DATA$person)
##D out.tdm <- exclude(dat3, unlist(the.no))
##D tm::inspect(out.tdm)
## End(Not run)



