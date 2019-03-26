## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse=TRUE,comment='#>')
set.seed(1014)

## ------------------------------------------------------------------------
library(themetagenomics)

GEVERS$OTU[1:5,1:5]

## ------------------------------------------------------------------------
GEVERS$TAX[1:5,1:3]

## ------------------------------------------------------------------------
tmp <- tempdir()
download_ref(tmp,reference='gg_ko',overwrite=FALSE)

## ------------------------------------------------------------------------
system.time(FUNCTIONS <- picrust(GEVERS$OTU,rows_are_taxa=FALSE,
                                 reference='gg_ko',reference_path=tmp,
                                 cn_normalize=TRUE,sample_normalize=FALSE,
                                 drop=TRUE))

## ------------------------------------------------------------------------
FUNCTIONS$fxn_table[1:5,1:5]

## ------------------------------------------------------------------------
names(FUNCTIONS$fxn_meta)

## ------------------------------------------------------------------------
head(FUNCTIONS$fxn_meta$KEGG_Description)

## ------------------------------------------------------------------------
head(FUNCTIONS$fxn_meta$KEGG_Pathways)

## ------------------------------------------------------------------------
FUNCTIONS$fxn_meta$KEGG_Description['K05846']
FUNCTIONS$fxn_meta$KEGG_Pathways['K05846']

## ------------------------------------------------------------------------
DAVID$ABUND[1:5,1:5]

## ------------------------------------------------------------------------
DAVID$TAX[1:5,1:3]

## ------------------------------------------------------------------------
tmp <- tempdir()
download_ref(tmp,reference='silva_ko',overwrite=FALSE)

## ------------------------------------------------------------------------
system.time(FUNCTIONS <- t4f(DAVID$ABUND,rows_are_taxa=FALSE,tax_table=DAVID$TAX,
                             reference_path=tmp,type='uproc',short=TRUE,
                             cn_normalize=TRUE,sample_normalize=TRUE,drop=TRUE))

