library(annotate)


### Name: genbank
### Title: A function to open the browser to Genbank with the selected
###   gene.
### Aliases: genbank
### Keywords: interface

### ** Examples

   ## Use UIDs to get data in both browser & data forms

   if ( interactive() ) {
      disp <- c("data","browser")
   } else {
      disp <- "data"
   }

   for (dp in disp)
     genbank("12345","9997",disp=dp,type="uid")

   ## Use accession numbers to retrieve browser info
   if ( interactive() )
       genbank("U03397","AF030427",disp="browser")



