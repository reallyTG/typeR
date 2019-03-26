library(rbacon)


### Name: bacon2clam
### Title: Translate Bacon .csv files to clam .csv files.
### Aliases: bacon2clam

### ** Examples

{
## No test: 
 tmpfl <- tempfile()	
  Bacon(run=FALSE, ask=FALSE, coredir=tmpfl)	
  bacon2clam("MSB2K", bacondir=tmpfl, clamdir=tmpfl)
 
## End(No test)
}



