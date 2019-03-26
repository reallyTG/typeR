library(seqinr)


### Name: translate
### Title: Translate nucleic acid sequences into proteins
### Aliases: translate
### Keywords: manip

### ** Examples

##
## Toy CDS example invented by Leonor Palmeira:
##
toycds <- s2c("tctgagcaaataaatcgg")
translate(seq = toycds) # should be c("S", "E", "Q", "I", "N", "R")
##
## Toy CDS example with ambiguous bases:
##
toycds2 <- s2c("tcngarcarathaaycgn")
translate(toycds2) # should be c("X", "X", "X", "X", "X", "X")
translate(toycds2, ambiguous = TRUE) # should be c("S", "E", "Q", "I", "N", "R")
translate(toycds2, ambiguous = TRUE, numcode = 2) # should be c("S", "E", "Q", "X", "N", "R")
##
## Real CDS example:
##
realcds <- read.fasta(file = system.file("sequences/malM.fasta", package ="seqinr"))[[1]]
translate(seq = realcds)
# Biologically correct, only one stop codon at the end
translate(seq = realcds, frame = 3, sens = "R", numcode = 6)
# Biologically meaningless, note the in-frame stop codons

## Not run: 
##D ## Need internet connection.
##D ## Translation of the following EMBL entry:
##D ##
##D ## FT   CDS             join(complement(153944..154157),complement(153727..153866),
##D ## FT                   complement(152185..153037),138523..138735,138795..138955)
##D ## FT                   /codon_start=1
##D ## FT                   /db_xref="FLYBASE:FBgn0002781"
##D ## FT                   /db_xref="GOA:Q86B86"
##D ## FT                   /db_xref="TrEMBL:Q86B86"
##D ## FT                   /note="mod(mdg4) gene product from transcript CG32491-RZ;
##D ## FT                   trans splicing"
##D ## FT                   /gene="mod(mdg4)"
##D ## FT                   /product="CG32491-PZ"
##D ## FT                   /locus_tag="CG32491"
##D ## FT                   /protein_id="AAO41581.1"
##D ## FT                   /translation="MADDEQFSLCWNNFNTNLSAGFHESLCRGDLVDVSLAAEGQIVKA
##D ## FT                   HRLVLSVCSPFFRKMFTQMPSNTHAIVFLNNVSHSALKDLIQFMYCGEVNVKQDALPAF
##D ## FT                   ISTAESLQIKGLTDNDPAPQPPQESSPPPAAPHVQQQQIPAQRVQRQQPRASARYKIET
##D ## FT                   VDDGLGDEKQSTTQIVIQTTAAPQATIVQQQQPQQAAQQIQSQQLQTGTTTTATLVSTN
##D ## FT                   KRSAQRSSLTPASSSAGVKRSKTSTSANVMDPLDSTTETGATTTAQLVPQQITVQTSVV
##D ## FT                   SAAEAKLHQQSPQQVRQEEAEYIDLPMELPTKSEPDYSEDHGDAAGDAEGTYVEDDTYG
##D ## FT                   DMRYDDSYFTENEDAGNQTAANTSGGGVTATTSKAVVKQQSQNYSESSFVDTSGDQGNT
##D ## FT                   EAQVTQHVRNCGPQMFLISRKGGTLLTINNFVYRSNLKFFGKSNNILYWECVQNRSVKC
##D ## FT                   RSRLKTIGDDLYVTNDVHNHMGDNKRIEAAKAAGMLIHKKLSSLTAADKIQGSWKMDTE
##D ## FT                   GNPDHLPKM"
##D choosebank("emblTP")
##D trans <- query("trans", "N=AE003734.PE35")
##D getTrans(trans$req[[1]])
##D ## Complex transsplicing operations, the correct frame and the correct 
##D ## genetic code are automatically used for translation into protein.
## End(Not run)



