library(seqinr)


### Name: crelistfromclientdata
### Title: To create on server an ACNUC list from data lines sent by client
### Aliases: crelistfromclientdata clfcd
### Keywords: utilities

### ** Examples

 ## Not run: 
##D  # Need internet connection
##D  choosebank("emblTP")
##D  #
##D  # Example with a file that contains sequence names:
##D  #
##D  fileSQ <- system.file("sequences/bb.mne", package = "seqinr")
##D  listSQ <- crelistfromclientdata("listSQ", file = fileSQ, type = "SQ")
##D  sapply(listSQ$req, getName)
##D  #
##D  # Example with a file that contains sequence accession numbers:
##D  #
##D  fileAC <- system.file("sequences/bb.acc", package = "seqinr")
##D  listAC <- crelistfromclientdata("listAC", file = fileAC, type = "AC")
##D  sapply(listAC$req, getName) 
##D  #
##D  # Example with a file that contains species names:
##D  #
##D  fileSP <- system.file("sequences/bb.sp", package = "seqinr")
##D  listSP <- crelistfromclientdata("listSP", file = fileSP, type = "SP")
##D  sapply(listSP$req, getName) 
##D  #
##D  # Example with a file that contains keywords:
##D  #
##D  fileKW <- system.file("sequences/bb.kwd", package = "seqinr")
##D  listKW <- crelistfromclientdata("listKW", file = fileKW, type = "KW")
##D  sapply(listKW$req, getName)
##D  #
##D  # Summary of ACNUC lists:
##D  #
##D  sapply(alr()$rank, getliststate)
##D  closebank() 
##D  
## End(Not run)



