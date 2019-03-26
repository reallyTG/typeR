## ---- message=FALSE, echo=FALSE------------------------------------------
#library(knitcitations)
#cleanbib()
#options("citation_format" = "pandoc")
#r<-citep("10.1093/nar/gkr917") 
#r<-citep("10.1101/gr.137323.112")
#r<-citep("10.1093/bioinformatics/btv402")
#write.bibtex(file="references.bib")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  install.packages("haploR", dependencies = TRUE)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  devtools::install_github("izhbannikov/haplor")

## ---- echo=TRUE, message=FALSE-------------------------------------------
library(haploR)
x <- queryHaploreg(query=c("rs10048158","rs4791078"))
x

## ---- echo=TRUE, message=FALSE-------------------------------------------
subset.high.LD <- x[as.numeric(x$r2) > 0.9, c("rsID", "r2", "chr", "pos_hg38", "is_query_snp", "ref", "alt")]
subset.high.LD

## ---- echo=TRUE, message=FALSE, eval=FALSE-------------------------------
#  require(openxlsx)
#  write.xlsx(x=subset.high.LD, file="subset.high.LD.xlsx")

## ---- echo=TRUE, message=FALSE-------------------------------------------
x[, c("Motifs", "rsID")]
x[, c("eQTL", "rsID")]

## ---- echo=TRUE, message=FALSE-------------------------------------------
library(haploR)
x <- queryHaploreg(file=system.file("extdata/snps.txt", package = "haploR"))
x

## ---- echo=TRUE, message=FALSE-------------------------------------------
library(haploR)
# Getting a list of existing studies:
studies <- getStudyList()
# Let us look at the first element:
studies[[1]]
# Let us look at the second element:
studies[[2]]
# Query Hploreg to explore results from 
# this study:
x <- queryHaploreg(study=studies[[1]])
x

## ---- echo=TRUE, eval=FALSE, message=FALSE-------------------------------
#  library(haploR)
#  tables <- getExtendedView(snp="rs10048158")
#  tables

## ---- echo=TRUE, message=FALSE-------------------------------------------
library(haploR)
x <- queryRegulome(c("rs4791078","rs10048158"))
x$res.table
x$bad.snp.id

## ---- echo=TRUE, message=FALSE-------------------------------------------
library(haploR)
ldmat <- LDlink.LDmatrix(snps=c("rs77264218", "rs11229158", "rs10896659", "rs10896702", "rs2042592"), population="AFR")
ldmat
# Stylish matrix R2
stylish.matrix.r2 <- makeStylishLDmatrix(ldmat$matrix.r2)
stylish.matrix.r2
# Stylish matrix D'
stylish.matrix.Dprime <- makeStylishLDmatrix(ldmat$matrix.dprime)
stylish.matrix.Dprime

## ---- echo=TRUE----------------------------------------------------------
sessionInfo()

