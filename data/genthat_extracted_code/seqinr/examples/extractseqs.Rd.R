library(seqinr)


### Name: extractseqs
### Title: To extract the sequences information of a sequence or a list of
###   sequence in different formats
### Aliases: extractseqs exseq
### Keywords: utilities

### ** Examples

 ## Not run: 
##D # Need internet connection
##D  choosebank("emblTP")
##D  mylist <- query("mylist", "k=globin", virtual = TRUE)
##D  mylist.fasta <- exseq("mylist", verbose = TRUE)
##D  # 103 lines of FASTA 
##D  stopifnot(length(mylist.fasta) == 103)
##D  closebank()
##D  
## End(Not run)



