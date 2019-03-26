library(phylotools)


### Name: rename.fasta
### Title: Rename the sequences for a fasta file
### Aliases: rename.fasta
### Keywords: fasta

### ** Examples


cat(
    ">seq_1",  "--TTACAAATTGACTTATTATA",
    ">seq_2",  "GATTACAAATTGACTTATTATA",
    ">seq_3",  "GATTACAAATTGACTTATTATA",
    ">seq_5",  "GATTACAAATTGACTTATTATA",
    ">seq_8",  "GATTACAAATTGACTTATTATA",
    ">seq_10", "---TACAAATTGAATTATTATA",
    file = "matk.fasta", sep = "\n")
old_name <- get.fasta.name("matk.fasta")
new_name <- c("Magnolia", "Ranunculus", "Carex", "Morus", "Ulmus", "Salix")
ref2 <- data.frame(old_name, new_name)
rename.fasta(infile = "matk.fasta", ref_table = ref2, outfile = "renamed.fasta")
unlink("matk.fasta")
unlink("renamed.fasta")



