library(DescTools)


### Name: WrdCaption
### Title: Insert Caption to Word
### Aliases: WrdCaption
### Keywords: print

### ** Examples

## Not run: 
##D  # Windows-specific example
##D wrd <- GetNewWrd()
##D 
##D # insert a title in level 1
##D WrdCaption("My First Caption level 1", index=1, wrd=wrd)
##D 
##D # works as well for several levels
##D sapply(1:5, function(i)
##D   WrdCaption(gettextf("My First Caption level %s",i), index=i, wrd=wrd)
##D )
## End(Not run)



