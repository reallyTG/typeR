library(seqinr)


### Name: choosebank
### Title: To select a database structured under ACNUC and located on the
###   web
### Aliases: choosebank
### Keywords: manip

### ** Examples

  ## Not run: 
##D # Need internet connection
##D   # Show available databases:  
##D   choosebank()
##D   # Show frozen databases:
##D   choosebank(tag = "TP")
##D   # Select a database:
##D   choosebank("emblTP", tag = "TP") 
##D   # Do something with the database:
##D   myseq <- gfrag("LMFLCHR36", start = 1, length = 30)
##D   stopifnot(myseq == "cgcgtgctggcggcaatgaagcgttcgatg")
##D   # Close the database:
##D   closebank()
## End(Not run)



