library(mallet)


### Name: mallet.read.dir
### Title: Import documents from a directory into Mallet format
### Aliases: mallet.read.dir

### ** Examples

## Not run: 
##D documents <- mallet.read.dir(Dir)
##D mallet.instances <- mallet.import(documents$id, documents$text, "en.txt",
##D 		    		token.regexp = "\\p{L}[\\p{L}\\p{P}]+\\p{L}")
## End(Not run)



