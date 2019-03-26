## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=5, dev="svg", fig.align="center")

## ------------------------------------------------------------------------
library(ontologyIndex)
data(hpo)

## ---- echo=FALSE---------------------------------------------------------
data.frame(property=names(hpo), class=sapply(hpo, class), stringsAsFactors=FALSE, row.names=NULL)

## ------------------------------------------------------------------------
get_term_property(ontology=hpo, property="ancestors", term="HP:0001873", as_names=TRUE)

## ------------------------------------------------------------------------
hpo$name["HP:0001873"]
hpo$id[grep(x=hpo$name, pattern="Thrombocytopenia")]
hpo$ancestors[["HP:0001873"]]
hpo$name[hpo$ancestors[["HP:0001873"]]]

## ------------------------------------------------------------------------
terms <- c("HP:0001871", "HP:0001873", "HP:0011877")
hpo$name[terms]
minimal <- minimal_set(hpo, terms)
hpo$name[minimal]

## ------------------------------------------------------------------------
get_ancestors(hpo, c("HP:0001873", "HP:0011877"))

