library(seqinr)


### Name: read.fasta
### Title: read FASTA formatted files
### Aliases: read.fasta readfasta FASTA

### ** Examples

#
# Simple sanity check with a small FASTA file:
#
  smallFastaFile <- system.file("sequences/smallAA.fasta", package = "seqinr")
  mySmallProtein <- read.fasta(file = smallFastaFile, as.string = TRUE, seqtype = "AA")[[1]]
  stopifnot(mySmallProtein == "SEQINRSEQINRSEQINRSEQINR*")
#
# Simple sanity check with the gzipped version of the same small FASTA file:
#
  smallFastaFile <- system.file("sequences/smallAA.fasta.gz", package = "seqinr")
  mySmallProtein <- read.fasta(file = smallFastaFile, as.string = TRUE, seqtype = "AA")[[1]]
  stopifnot(mySmallProtein == "SEQINRSEQINRSEQINRSEQINR*")
#
# Example of a DNA file in FASTA format:
#
  dnafile <- system.file("sequences/malM.fasta", package = "seqinr")
#
# Read with defaults arguments, looks like:
#
# $XYLEECOM.MALM
# [1] "a" "t" "g" "a" "a" "a" "a" "t" "g" "a" "a" "t" "a" "a" "a" "a" "g" "t"
# ...
  read.fasta(file = dnafile)
#
# The same but do not turn the sequence into a vector of single characters, looks like:
#
# $XYLEECOM.MALM
# [1] "atgaaaatgaataaaagtctcatcgtcctctgtttatcagcagggttactggcaagcgc 
# ...
  read.fasta(file = dnafile, as.string = TRUE)
#
# The same but do not force lower case letters, looks like:
#
# $XYLEECOM.MALM
# [1] "ATGAAAATGAATAAAAGTCTCATCGTCCTCTGTTTATCAGCAGGGTTACTGGCAAGC
# ...
  read.fasta(file = dnafile, as.string = TRUE, forceDNAtolower = FALSE)
#
# Example of a protein file in FASTA format:
#
  aafile <- system.file("sequences/seqAA.fasta", package = "seqinr")
#
# Read the protein sequence file, looks like:
#
# $A06852
# [1] "M" "P" "R" "L" "F" "S" "Y" "L" "L" "G" "V" "W" "L" "L" "L" "S" "Q" "L"
# ...
  read.fasta(aafile, seqtype = "AA")
#
# The same, but as string and without attributes, looks like:
#
# $A06852
# [1] "MPRLFSYLLGVWLLLSQLPREIPGQSTNDFIKACGRELVRLWVEICGSVSWGRTALSLEEP
# QLETGPPAETMPSSITKDAEILKMMLEFVPNLPQELKATLSERQPSLRELQQSASKDSNLNFEEFK
# KIILNRQNEAEDKSLLELKNLGLDKHSRKKRLFRMTLSEKCCQVGCIRKDIARLC*"
#
  read.fasta(aafile, seqtype = "AA", as.string = TRUE, set.attributes = FALSE)
#
# Example with a FASTA file that contains comment lines starting with
# a semicolon character ';'
#
  legacyfile <- system.file("sequences/legacy.fasta", package = "seqinr")
  legacyseq <- read.fasta(file = legacyfile, as.string = TRUE)
  stopifnot( nchar(legacyseq) == 921 )
#
# Example of a MAQ binary fasta file produced with maq fasta2bfa ct.fasta ct.bfa
# on a platform where .Platform$endian == "little" and .Machine$sizeof.longlong == 8
#
  fastafile <- system.file("sequences/ct.fasta.gz", package = "seqinr")
  bfafile <- system.file("sequences/ct.bfa", package = "seqinr")

  original <- read.fasta(fastafile, as.string = TRUE, set.att = FALSE)
  bfavers <- read.fasta(bfafile, as.string = TRUE, set.att = FALSE, bfa = TRUE,
    endian = "little", sizeof.longlong = 8)
  if(!identical(original, bfavers)){
     warning(paste("trouble reading bfa file on a platform with endian =", 
     .Platform$endian, "and sizeof.longlong =", .Machine$sizeof.longlong))
  }



