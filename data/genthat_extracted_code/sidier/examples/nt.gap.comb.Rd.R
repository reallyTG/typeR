library(sidier)


### Name: nt.gap.comb
### Title: substitution and indel distance combinations
### Aliases: nt.gap.comb

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

 # Estimating indel distances after reading the alignment from file:
distGap<-MCIC(input="ex2.fas",saveFile=FALSE)
 # Estimating substitution distances after reading the alignment from file:
library(ape)
align<-read.dna(file="ex2.fas",format="fasta")
dist.nt<-dist.dna(align,model="raw",pairwise.deletion=TRUE)
DISTnt<-as.matrix(dist.nt)
 # Obtaining 11 corrected combined matrices using a range of alpha values:
nt.gap.comb(DISTgap=distGap, alpha=seq(0,1,0.1), method="Corrected", 
saveFile=FALSE, DISTnuc=DISTnt)
 # Obtaining the arithmetic mean of both matrices using both the corrected
 # and the uncorrected methods.
nt.gap.comb(DISTgap=distGap, alpha=0.5, method="Uncorrected", saveFile=FALSE,
 DISTnuc=DISTnt)
 # Obtaining a range of combinations...
Range01<-nt.gap.comb(DISTgap=distGap, alpha=seq(0,1,0.1), method="Uncorrected",
 saveFile=FALSE, DISTnuc=DISTnt)
 # ...and displaying the arithmetic mean (alpha=0.5 is the element number 6
 # in the resulting data frame):
Range01[[6]]



