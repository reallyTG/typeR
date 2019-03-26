library(caRpools)


### Name: get.gene.info
### Title: Retrieving Gene Annotation and Gene Identifier Conversion from
###   BiomaRt
### Aliases: get.gene.info
### Keywords: ~Analysis

### ** Examples

data(caRpools)
#CONTROL1.replaced = get.gene.info(CONTROL1, namecolumn=1,
#extractpattern=expression("^(.+?)(_.+)"), host="www.ensembl.org",
#database="ensembl", #dataset="hsapiens_gene_ensembl",
#filters="hgnc_symbol",attributes = c("ensembl_gene_id"),
#return.val = "dataset")

#knitr::kable(CONTROL1.replaced[1:10,])

#CONTROL1.replaced.info = get.gene.info(CONTROL1, namecolumn=1,
#extractpattern=expression("^(.+?)(_.+)"), database="ensembl",
#dataset="hsapiens_gene_ensembl", filters="hgnc_symbol",
#attributes = c("ensembl_gene_id","description"), return.val = "info")

#knitr::kable(CONTROL1.replaced.info[1:10,])



