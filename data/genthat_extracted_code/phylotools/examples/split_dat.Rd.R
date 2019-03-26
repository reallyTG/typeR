library(phylotools)


### Name: split_dat
### Title: grouping the data frame containing sequences and names and
###   generate fasta file
### Aliases: split_dat
### Keywords: fasta

### ** Examples


  cat(
  ">seq_1",   "--TTACAAATTGACTTATTATA",
  ">seq_2",   "GATTACAAATTGACTTATTATA",
  ">seq_3",   "GATTACAAATTGACTTATTATA",
  ">seq_5",   "GATTACAAATTGACTTATTATA",
  ">seq_8",   "GATTACAAATTGACTTATTATA",
  ">seq_10",  "---TACAAATTGAATTATTATA",
  ">seq_11",  "--TTACAAATTGACTTATTATA",
  ">seq_12",  "GATTACAAATTGACTTATTATA",
  ">seq_13",  "GATTACAAATTGACTTATTATA",
  ">seq_15",  "GATTACAAATTGACTTATTATA",
  ">seq_16",  "GATTACAAATTGACTTATTATA",
  ">seq_17",  "---TACAAATTGAATTATTATA",
  file = "trnh.fasta", sep = "\n")

sequence_name <- get.fasta.name("trnh.fasta")
sequence_group <- c("group1","group1","group1","group1","group1",
"group2","group2","group2","group3","group3","group3","group3")
group <- data.frame(sequence_name, sequence_group)

fasta <- read.fasta("trnh.fasta")
split_dat(fasta, group)

unlink("trnh.fasta")
unlink("ungrouped.fasta")
unlink("group1.fasta")
unlink("group2.fasta")
unlink("group3.fasta")




