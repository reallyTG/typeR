library(sidier)


### Name: FilterHaplo
### Title: Filter haplotypes by occurrence
### Aliases: FilterHaplo

### ** Examples

cat(">Population1_sequence1",
"TTATAAAATCTA----TAGC",
">Population1_sequence2",
"TAAT----TCTA----TAAC",
">Population1_sequence3",
"TTATAAAAATTA----TAGC",
">Population1_sequence4",
"TAAT----TCTA----TAAC",
">Population2_sequence1",
"TTAT----TCGA----TAGC",
">Population2_sequence2",
"TTAT----TCGA----TAGC",
">Population2_sequence3",
"TTAT----TCGA----TAGC",
">Population2_sequence4",
"TTAT----TCGA----TAGC",
">Population3_sequence1",
"TTAT----TCGAGGGGTAGC",
">Population3_sequence2",
"TAAT----TCTA----TAAC",
">Population3_sequence3",
"TTATAAAA--------TAGC",
">Population3_sequence4",
"TTAT----TCGAGGGGTAGC",
     file = "ex2.fas", sep = "\n")
library(ape)
example<-read.dna(file="ex2.fas",format="fasta")

# Exclude unique haplotypes
FilterHaplo(align=example,Nmin=2)

# Include only unique haplotypes
FilterHaplo(align=example,Nmax=1)

# Filter haplotypes appearing between 2 and 4 times
FilterHaplo(align=example,Nmax=4,Nmin=2)



