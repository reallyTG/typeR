library(seqinr)


### Name: savelist
### Title: Save sequence names or accession numbers into a file
### Aliases: savelist
### Keywords: utilities

### ** Examples

## Not run: 
##D  
##D   ### Need internet connection
##D   choosebank("emblTP")
##D   mylist <- query("mylist", "sp=felis catus et t=cds", virtual=TRUE)
##D   savelist(glr("mylist"))
##D   # 603 sequence mnemonics written into file: MYLIST.mne 
##D   savelist(glr("mylist"), type = "A")
##D   # 603 sequence accession numbers written into file: MYLIST.acc
##D   
## End(Not run)



