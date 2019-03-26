library(sidier)


### Name: perc.thr
### Title: Percolation threshold network
### Aliases: perc.thr

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
dist.nt <-dist.dna(align,model="raw",pairwise.deletion=TRUE)
DISTnt<-as.matrix(dist.nt)


 # Obtaining the arithmetic mean of both matrices using the corrected method:
CombinedDistance<-nt.gap.comb(DISTgap=distGap, alpha=0.5, method="Corrected",
saveFile=FALSE, DISTnuc=DISTnt)
 # Estimating the percolation threshold of the combined distance, modifying
 # labels:
perc.thr(dis=CombinedDistance,label=paste(substr(row.names(
CombinedDistance),11,11),substr(row.names(CombinedDistance),21,21),sep="-"))

 # The same network showing different modules as different colours
 # (randomly selected):
perc.thr(dis=as.data.frame(CombinedDistance),label=paste(substr(row.names(
as.data.frame(CombinedDistance)),11,11),substr(row.names(as.data.frame(
CombinedDistance)),21,21),sep="-"), modules=TRUE)

 # The same network showing different modules as different colours
 # (defined by user):
perc.thr(dis=as.data.frame(CombinedDistance),label=paste(substr(row.names(
as.data.frame(CombinedDistance)),11,11),substr(row.names(as.data.frame(
CombinedDistance)),21,21),sep="-"), modules=TRUE,moduleCol=c("pink",
"lightblue","lightgreen"))
 




