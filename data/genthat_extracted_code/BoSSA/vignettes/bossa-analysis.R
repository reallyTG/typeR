## ----style, echo = FALSE, results = 'asis'-------------------------------

## ----load-packages, message=FALSE, warning=FALSE-------------------------
library("BoSSA")

## ------------------------------------------------------------------------
refpkg_path <- paste(find.package("BoSSA"),"/extdata/example.refpkg",sep="")
refpkg(refpkg_path)

## ------------------------------------------------------------------------
taxo <- refpkg(refpkg_path,type="taxonomy")
head(taxo)

## ----pie1, fig.width=5, fig.height=5-------------------------------------
refpkg(refpkg_path,type="pie",cex.text=0.5)

## ----pie2, fig.width=5, fig.height=5-------------------------------------
refpkg(refpkg_path,type="pie",rank_pie=c("class","order","family"),cex.text=0.6)

## ----refseqtree, fig.width=8, fig.height=8-------------------------------
refpkg(refpkg_path,type="tree",rank_tree="class",cex.text=0.5)

## ------------------------------------------------------------------------
sqlite_file <- system.file("extdata", "example.sqlite", package = "BoSSA")
jplace_file <- system.file("extdata", "example.jplace", package = "BoSSA")

## ------------------------------------------------------------------------
pplace <- read_sqlite(sqlite_file,jplace_file)
pplace

## ------------------------------------------------------------------------
str(pplace)

## ----test1, fig.width=9, fig.height=9------------------------------------
plot(pplace,type="number",main="number",cex.number=1.5)

## ----test2, fig.width=9,fig.height=9-------------------------------------
plot(pplace,type="color",main="color",edge.width=2)

## ----testfat, fig.width=9,fig.height=9-----------------------------------
plot(pplace,type="fattree",main="fattree")

## ----test3, fig.width=9,fig.height=9-------------------------------------
plot(pplace,type="precise",main="precise")

## ----test4, fig.width=9,fig.height=9-------------------------------------
plot(pplace,type="precise",main="precise",transfo=function(X){X*2})

## ------------------------------------------------------------------------
sub1 <- sub_pplace(pplace,placement_id=1:100)
sub1

## ------------------------------------------------------------------------
ids <- sample(pplace$multiclass$name,50)
sub2 <- sub_pplace(pplace,ech_id=ids)
sub2

## ------------------------------------------------------------------------
pplace_table <- pplace_to_table(pplace,type="best")
head(pplace_table,n=3)

## ------------------------------------------------------------------------
example_contingency <- pplace_to_matrix(pplace,c(rep("sample1",50),rep("sample2",50)),tax_name=TRUE)
example_contingency

## ------------------------------------------------------------------------
example_taxo <- pplace_to_taxonomy(pplace,taxo,tax_name=TRUE,rank=c("order","family","genus","species"))
head(example_taxo)

## ------------------------------------------------------------------------
example_OTU <- matrix(sample(1:100, 500, replace = TRUE), nrow = 100, ncol = 5,dimnames=list(pplace$multiclass$name,paste("sample",1:5,sep="_")))
head(example_OTU)

## ------------------------------------------------------------------------
#library(phyloseq)
#example_phyloseq <- phyloseq(otu_table(example_OTU,taxa_are_rows=TRUE),tax_table(example_taxo))
#example_phyloseq

## ------------------------------------------------------------------------
citation("BoSSA")

