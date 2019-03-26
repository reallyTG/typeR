library(seqinr)


### Name: kaks
### Title: Ka and Ks, also known as dn and ds, computation
### Aliases: kaks

### ** Examples

 #
 # Simple Toy example:
 #
 s <- read.alignment(file = system.file("sequences/test.phylip", package = "seqinr"),
  format = "phylip")
 kaks(s)
 #
 # Check numeric results on an simple test example:
 #
 data(AnoukResult)
 Anouk <- read.alignment(file = system.file("sequences/Anouk.fasta", package = "seqinr"),
  format = "fasta")	
 if( ! all.equal(kaks(Anouk), AnoukResult) ) {
   warning("Poor numeric results with respect to AnoukResult standard")
 } else {
   print("Results are consistent with AnoukResult standard")
 }
#
# As from seqinR 2.0-3 the following alignment with out-of-frame gaps
# should return a zero Ka value.
#
# >Reference
# ATGTGGTCGAGATATCGAAAGCTAGGGATATCGATTATATATAGCAAGATCGATAGAGGA
# TCGATGATCGATCGGGATCGACAGCTG
# >With out-of-frame gaps
# AT-TGGTCCAGGTATCGTAAGCTAGGGATATCGATTATATATAGCAAGATCGATAGGGGA
# TCGATGATCGATCGGGA--GACAGCTG
#
# This test example provided by Darren Obbard is now used as a routine check: 
#
 Darren <- read.alignment(file = system.file("sequences/DarrenObbard.fasta", package = "seqinr"),
  format = "fasta")
 stopifnot( all.equal(kaks(Darren)$ka[1], 0) )
#
# As from seqinR 3.4-0, non-finite values should never be returned for
# Ka and Ks even for small sequences. The following test checks that this
# is true for an alignement of the 64 codons, so that we compute Ka and
# Ks for all possible pairs of codons.
#
wrd <- as.alignment(nb = 64, nam = words(), seq = words())
res <- kaks(wrd)
if(any(!is.finite(res$ka))) stop("Non finite value returned for Ka")
if(any(!is.finite(res$ks))) stop("Non finite value returned for Ks")




