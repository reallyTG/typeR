library(sidier)


### Name: mutation.network
### Title: Haplotype network depiction including mutations
### Aliases: mutation.network

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

library(ape)

#Network with default options
mutation.network (align=read.dna(file="ex2.fas",format="fasta"))

#Using more options:
mutation.network (align=read.dna(file="ex2.fas",format="fasta"),modules=TRUE)

#A more complex alignment
data(ex_alignment1) # this will read a fasta file with the name 'alignExample'
mutation.network (align=alignExample,modules=TRUE,
InScale=2, SuScale=2,legend=TRUE,lwd.mut=1.8)




