## ----message=FALSE-------------------------------------------------------
library(microclass)
KmerCount("ATGCCTGAACTGACCTGC", K=1, col.names = TRUE)
KmerCount("ATGCCTGAACTGACCTGC", K=2, col.names = TRUE)
KmerCount("ATGCCTGAACTGACCTGC", K=3, col.names = TRUE)

## ------------------------------------------------------------------------
data(small.16S)
tax.tab <- taxMachine(small.16S$Sequence)
head(tax.tab)

genus <- sapply(strsplit(small.16S$Header,split=" "),function(x){x[2]})
cat( "Number of errors:", sum(genus != tax.tab$Genus) )

## ---- fig.cap = "Classification uncertainty scores"----------------------
par(mfrow = c(1,2), mar = c(2.5,2,3,1))
boxplot(tax.tab$D.score, factor(genus), main = "D-score")
boxplot(tax.tab$R.score, factor(genus), main = "R-score")

## ------------------------------------------------------------------------
tax.tab$Is.Recognized <- tax.tab$P.recognized>0.01
tax.tab[35:45,]

## ------------------------------------------------------------------------
rdp <- rdpTrain(small.16S$Sequence[seq(1,71,2)], genus[seq(1,71,2)])  # training step
predicted <- rdpClassify(small.16S$Sequence[seq(2,71,2)], rdp)        # classification step
cat( "Number of errors:", sum(predicted != genus[seq(2,71,2)]) )

