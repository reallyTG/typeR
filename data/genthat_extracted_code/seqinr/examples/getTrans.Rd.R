library(seqinr)


### Name: getTrans
### Title: Generic function to translate coding sequences into proteins
### Aliases: getTrans getTrans.default getTrans.list getTrans.character
###   getTrans.SeqFrag getTrans.SeqAcnucWeb getTrans.SeqFastadna
###   getTrans.qaw getTrans.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getTrans generic function:
#
   methods(getTrans)
#
# Toy CDS example invented by Leonor Palmeira:
#
  toycds <- s2c("tctgagcaaataaatcgg")
  getTrans(toycds) # should be c("S", "E", "Q", "I", "N", "R")
#
# Toy CDS example with ambiguous bases:
#
  toycds2 <- s2c("tcngarcarathaaycgn")
  getTrans(toycds2) # should be c("X", "X", "X", "X", "X", "X")
  getTrans(toycds2, ambiguous = TRUE) # should be c("S", "E", "Q", "I", "N", "R")
  getTrans(toycds2, ambiguous = TRUE, numcode = 2) # should be c("S", "E", "Q", "X", "N", "R")
#
# Real CDS example:
#
  realcds <- read.fasta(file = system.file("sequences/malM.fasta", package ="seqinr"))[[1]]
  getTrans(realcds)
# Biologically correct, only one stop codon at the end
  getTrans(realcds, frame = 3, sens = "R", numcode = 6)
# Biologically meaningless, note the in-frame stop codons

#
# Complex transsplicing operations, the correct frame and the correct 
# genetic code are automatically used for translation into protein for
# sequences coming from an ACNUC server:
#
## Not run: 
##D   # Need internet connection.
##D   # Translation of the following EMBL entry:
##D   #
##D   # FT   CDS             join(complement(153944..154157),complement(153727..153866),
##D   # FT                   complement(152185..153037),138523..138735,138795..138955)
##D   # FT                   /codon_start=1
##D   choosebank("emblTP")
##D   trans <- query("trans", "N=AE003734.PE35")
##D   getTrans(trans$req[[1]])
## End(Not run)



