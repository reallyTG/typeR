library(phylotools)


### Name: clean.fasta.name
### Title: Clean the name of a fasta file
### Aliases: clean.fasta.name
### Keywords: fasta

### ** Examples


  cat(
    ">seq_1*66",  "--TTACAAATTGACTTATTATA",
    ">seq_2()r",  "GATTACAAATTGACTTATTATA",
    ">seq_3:test",  "GATTACAAATTGACTTATTATA",
    ">seq_588",  "GATTACAAATTGACTTATTATA",
    ">seq_8$$yu",  "GATTACAAATTGACTTATTATA",
    ">seq_10", "---TACAAATTGAATTATTATA",
    file = "matk.fasta", sep = "\n")

  clean.fasta.name(infile = "matk.fasta")
  get.fasta.name("name_cleaned.fasta")

  # Delete file
  unlink("matk.fasta")
  unlink("name_cleaned.fasta")



