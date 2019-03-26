library(sidier)


### Name: GetHaplo
### Title: Get sequences of unique haplotypes
### Aliases: GetHaplo

### ** Examples

	#generating an alignment file:
cat(">Population1_sequence1",
"TTATAAAATCTA----TAGC",
">Population1_sequence2",
"TAAT----TCTA----TAAC",
">Population1_sequence3",
"TTATAAAAATTA----TAGC",
">Population1_sequence4",
"TAAT----TCTA----TAAC",
">Population2_sequence1",
"TTAT----TCGAGGGGTAGC",
">Population2_sequence2",
"TAAT----TCTA----TAAC",
">Population2_sequence3",
"TTATAAAA--------TAGC",
">Population2_sequence4",
"TTAT----TCGAGGGGTAGC",
">Population3_sequence1",
"TTAT----TCGA----TAGC",
">Population3_sequence2",
"TTAT----TCGA----TAGC",
">Population3_sequence3",
"TTAT----TCGA----TAGC",
">Population3_sequence4",
"TTAT----TCGA----TAGC",
     file = "ex2.fas", sep = "\n")

# Getting unique haplotypes reading the alignment from a file and setting
#haplotype names:
	GetHaplo(inputFile="ex2.fas",outname="ex2_unique.fas",seqsNames=
c("HaploK001","HaploK002","HaploS001","HaploR001","HaploR002","HaploR003"))
# Reading the alignment from an object and using original sequence names:
    library(ape)
    example2 <- read.dna("ex2.fas", format = "fasta")
	GetHaplo(align=example2,outname="Haplotypes_DefaultNames.txt")
# Reading the alignment from an object and using new haplotype names:
	GetHaplo(align=example2,outname="Haplotypes_sequentialNames.txt",
seqsNames="Inf.Hap")


	#generating a new alignment file with identical sequences wrongly alined:
cat(">Pop1_seq1",
"TTATTCTA--------TAGC",
">Pop1_seq2",
"TTAT----TCTA----TAGC",
">Pop1_seq3",
"TAAT----TCTA------AC",
     file = "ex2.2.fas", sep = "\n")

# Note that seq1 and seq2 are equal, but the alignment is different.
# However, this function identifies seq1 and seq2 as identical:
	a<-GetHaplo(inputFile="ex2.2.fas",saveFile=FALSE)




