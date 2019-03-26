library(MultiJoin)


### Name: MakeFIFOs
### Title: creates named Unix pipes, which gzipped files can be streamed to
###   for e.g. further joins
### Aliases: MakeFIFOs

### ** Examples



if (0){


  MakeFIFOs(verbose=2)


  MakeFIFOs(filterStr=" | awk '$2 > 100 && $3 > 5' | 


          cut -f2,3 -d\" \" --complement | head -n 10000 | sort -k1,1")


}





