## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(dev="svg", fig.width=7, fig.height=7)

## ------------------------------------------------------------------------
library(BeviMed)
source(paste0(system.file(package="BeviMed", "/scripts/vcf.R")))

## ----eval=FALSE----------------------------------------------------------
#  ac_matrix <- vcf2matrix("my-vcf.vcf.gz", chr="2", from=1, to=1e4)
#  pheno <- read.table(file="my-phenotype-data.txt", header=TRUE)
#  
#  bevimed(y=pheno$disease_status, G=ac_matrix)

