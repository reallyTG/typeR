library(sidier)


### Name: FindHaplo
### Title: Find equal haplotypes
### Aliases: FindHaplo

### ** Examples


	#generating an alignment file:
cat(">Population1_sequence1",
"TTATAGGTAGCTTCGATATTG",
">Population2_sequence1",
"TTA---GTAGCTTCGAAATTG",
">Population3_sequence1",
"TTA---GTA---TCG---TAG",
">Population4_sequence1",
"TTATAGGTA---TCG---TTG",
">Population5_sequence1",
"TTA------------AAATTG",
file = "ex1.fas", sep = "\n")

	 # Reading the alignment directly from file:
	 FindHaplo(inputFile="ex1.fas") 

	 # Reading the alignment from an object:
library(ape)
example1<-read.dna(file="ex1.fas",format="fasta")
FindHaplo(align=example1)

	#generating a new alignment file with identical sequences wrongly aligned:
cat(">Pop1_seq1",
"TTATTCTA--------TAGC",
">Pop1_seq2",
"TTAT----TCTA----TAGC",
">Pop1_seq3",
"TAAT----TCTA------AC",
     file = "ex2.2.fas", sep = "\n")

# Note that seq1 and seq2 are equal, but the alignment is different.
# However, this function identifies seq1 and seq2 as identical:
FindHaplo(inputFile="ex2.2.fas")




