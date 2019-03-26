## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(prozor)
#library(reshape2)

rm(list=ls())

file = system.file("extdata/IDResults.txt.gz" , package = "prozor")
specMeta <- readr::read_tsv(file)


## ------------------------------------------------------------------------

nrow(specMeta)
hist(specMeta$score, breaks=100)


## ------------------------------------------------------------------------
length(unique(specMeta$peptideSeq))
upeptide <-unique(specMeta$peptideSeq)

resAll <- prozor::readPeptideFasta(system.file("extdata/Annotation_allSeq.fasta.gz" , package = "prozor"))
resRev <- prozor::readPeptideFasta(system.file("extdata/Annotation_canSeq.fasta.gz" , package = "prozor"))

annotAll <- prozor::annotatePeptides(upeptide,resAll)
pcAll <- length(unique(annotAll$peptideSeq))/ length(upeptide)

annotRev <- prozor::annotatePeptides(upeptide, resRev)
pcCan <-length(unique(annotRev$peptideSeq))/ length(upeptide)

barplot(c(Canonical = pcCan, All = pcAll))


## ---- fig="Nr of protein ID's per peptide"-------------------------------

par(mfrow=c(1,3))
plot(sort(table(annotAll$peptideSeq)),axes=F, ylab="Nr protein IDs")
axis(2)
PCProteotypic_all <- sum(table(annotAll$peptideSeq) == 1)/ length(table(annotAll$peptideSeq)) * 100

#plot(sort(table(annotIso$peptideSeq)),axes=F, ylab="Nr protein IDs")
#axis(2)
#PCProteotypic_iso <- sum(table(annotIso$peptideSeq) == 1)/ length(table(annotIso$peptideSeq)) * 100

plot(sort(table(annotRev$peptideSeq)),axes=F, ylab="Nr protein IDs")
axis(2)

PCProteotypic_canonical <- sum(table(annotRev$peptideSeq) == 1)/ length(table(annotRev$peptideSeq)) * 100

## ------------------------------------------------------------------------
barplot(c(All = PCProteotypic_all, canonical =  PCProteotypic_canonical),las=2, ylab="% proteotypic" )


## ------------------------------------------------------------------------
library(Matrix)
precursors <- unique(subset(specMeta,select = c(peptideModSeq,precursorCharge,peptideSeq )))


## ------------------------------------------------------------------------

annotatedPrecursors <-merge(precursors ,
                            subset(annotAll, select= c(peptideSeq,proteinID)),
                            by.x="peptideSeq", 
                            by.y="peptideSeq")

annotatedPrecursors$precursorCharge <- annotatedPrecursors$precursorCharge
annotatedPrecursors$peptideModSeq <- annotatedPrecursors$peptideModSeq
head(annotatedPrecursors)
xx<-prepareMatrix(annotatedPrecursors,proteinID = "proteinID", peptideID = "peptideSeq")

library(Matrix)
image(xx)
xxAll <- greedy(xx)


## ------------------------------------------------------------------------

annotatedPrecursors <-merge(precursors , subset(annotRev, select= c(peptideSeq,proteinID)), by.x="peptideSeq", 
                            by.y="peptideSeq")

annotatedPrecursors$precursorCharge <- annotatedPrecursors$precursorCharge
annotatedPrecursors$peptideModSeq <- annotatedPrecursors$peptideModSeq

xx<-prepareMatrix(annotatedPrecursors ,proteinID = "proteinID", peptideID = "peptideSeq")
image(xx)
xxCAN <- greedy(xx)

## ----fig.cap="Number of Proteins after protein inference."---------------
barplot(c(All = length(unique(unlist(xxAll))) , canonical = length(unique(unlist(xxCAN)))    ))

