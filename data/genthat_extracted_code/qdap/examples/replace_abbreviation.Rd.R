library(qdap)


### Name: replace_abbreviation
### Title: Replace Abbreviations
### Aliases: replace_abbreviation
### Keywords: abbreviation

### ** Examples

## Not run: 
##D x <- c("Mr. Jones is here at 7:30 p.m.",  
##D     "Check it out at www.github.com/trinker/qdap",
##D     "i.e. He's a sr. dr.; the best in 2012 A.D.",
##D     "the robot at t.s. is 10ft. 3in.")
##D 
##D replace_abbreviation(x)
##D 
##D #create abbreviation and replacement vectors
##D abv <- c("in.", "ft.", "t.s.")
##D repl <- c("inch", "feet", "talkstats")
##D 
##D replace_abbreviation(x, abv, repl)
##D 
##D (KEY <- rbind(abbreviations, data.frame(abv = abv, rep = repl)))
##D replace_abbreviation(x, KEY)
## End(Not run)



