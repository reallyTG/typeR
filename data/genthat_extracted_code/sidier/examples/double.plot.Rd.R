library(sidier)


### Name: double.plot
### Title: Haplotype and population networks including mutations and
###   haplotype frequencies.
### Aliases: double.plot

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

# Double plot (computation time may exceed 5 seconds)
#double.plot(align=read.dna(file="ex2.fas",format="fasta"))

# Other options
#data(ex_alignment1) # this will read a fasta file with the name 'alignExample'
#double.plot(alignExample,label.sub.str.mut=c(7,9))
#double.plot(alignExample,label.sub.str.mut=c(7,9),InScale=3,SuScale=2,lwd.mut=1.5)



