library(annotate)


### Name: pubmed
### Title: A function to open the browser to Pubmed with the selected gene.
### Aliases: pubmed
### Keywords: interface

### ** Examples

   if( interactive() )
    opts <- c("data","browser") else
    opts <- "data"
   for (dp in opts)
     pubmed("11780146","11886385","11884611",disp=dp)



