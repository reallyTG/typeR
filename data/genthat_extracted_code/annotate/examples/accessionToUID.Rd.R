library(annotate)


### Name: accessionToUID
### Title: A function to convert accession values to NCBI UIDs.
### Aliases: accessionToUID
### Keywords: interface

### ** Examples


     ## The two returns from genbank should be the same
     xdoc <- genbank("U03397",type="accession",disp="data")
     x <- accessionToUID("U03397",db="genbank")
     xdoc <- genbank(x, type="uid",disp="data")

     ## Can handle multiple inputs
     y <- accessionToUID("M16653","U892893",db="genbank")



