library(sidier)


### Name: pie.network
### Title: Population network depiction including haplotype frequencies
### Aliases: pie.network

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

# The input format is recognized, and names identifiers can be omitted:
	 pie.network(align=example)

# Is identical to:
	 pie.network(align=example, NameIniPopulations=1,NameEndPopulations=11)

# Using different colours:
	 pie.network(align=example, NameIniPopulations=1,NameEndPopulations=11,
	 col.pie=c("red","blue","pink","orange","black","grey"))

# col.pie is omitted if less colours than haplotypes are defined:
	 pie.network(align=example, NameIniPopulations=1,NameEndPopulations=11,
	 col.pie=c("red","blue","pink"))

# and also if more colours than haplotypes are defined:
	  pie.network(align=example, NameIniPopulations=1,NameEndPopulations=11,
	 col.pie=c("red","blue","green","purple","pink","orange","gray"))




