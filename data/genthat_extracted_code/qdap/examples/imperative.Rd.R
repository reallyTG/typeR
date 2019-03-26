library(qdap)


### Name: imperative
### Title: Intuitively Remark Sentences as Imperative
### Aliases: imperative

### ** Examples

## Not run: 
##D dat <- data.frame(name=c("sue", rep(c("greg", "tyler", "phil", 
##D     "sue"), 2)), statement=c("go get it|", "I hate to read.", 
##D     "Stop running!", "I like it!", "You are terrible!", "Don't!", 
##D     "Greg, go to the red, brick office.", "Tyler go to the gym.", 
##D     "Alex don't run."), stringsAsFactors = FALSE)
##D 
##D imperative(dat, "name", "statement", , c("Alex"))
##D imperative(dat, "name", "statement", lock.incomplete = TRUE, c("Alex"))
##D imperative(dat, "name", "statement", , c("Alex"), warning=TRUE)
##D imperative(dat, "name", "statement", , c("Alex"), warning=TRUE,  
##D     parallel = TRUE)
## End(Not run)



