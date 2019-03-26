library(seqinr)


### Name: gb2fasta
### Title: Conversion of GenBank file into fasta file
### Aliases: gb2fasta
### Keywords: utilities

### ** Examples

  myGenBankFile <- system.file("sequences/ct.gbk.gz", package = "seqinr")
  myFastaFileName <- "Acinetobacter_ADP1_uid61597.fasta"
  gb2fasta(myGenBankFile, myFastaFileName)
  readLines(myFastaFileName)[1:5]
  #
  # Should be :
  #
  # [1] ">CHLTCG 1042519 bp"                                          
  # [2] "gcggccgcccgggaaattgctaaaagatgggagcaaagagttagagatctacaagataaa"
  # [3] "ggtgctgcacgaaaattattaaatgatcctttaggccgacgaacacctaattatcagagc"
  # [4] "aaaaatccaggtgagtatactgtagggaattccatgttttacgatggtcctcaggtagcg"
  # [5] "aatctccagaacgtcgacactggtttttggctggacatgagcaatctctcagacgttgta"
  #



