## ----echo=FALSE-------------------------------------------------------------------------
options(width = 90)

## ---------------------------------------------------------------------------------------
library("grex")
data("gtexv7")
id = gtexv7[101:200]
df = grex(id)
tail(df)

## ---------------------------------------------------------------------------------------
filtered_genes =
  df[!is.na(df$"entrez_id"),
     c("ensembl_id", "entrez_id", "hgnc_symbol", "gene_biotype")]
head(filtered_genes)

