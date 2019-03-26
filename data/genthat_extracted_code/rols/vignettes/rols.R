## ----env, echo=FALSE-------------------------------------------------------
suppressPackageStartupMessages(library("GO.db"))
suppressPackageStartupMessages(library("BiocStyle"))
suppressPackageStartupMessages(library("rols"))
suppressPackageStartupMessages(library("DT"))
nonto <- length(ol <- Ontologies())

## ----install, eval=FALSE---------------------------------------------------
#  ## try http:// if https:// URLs are not supported
#  if (!requireNamespace("BiocManager", quietly=TRUE))
#      install.packages("BiocManager")
#  BiocManager::install("rols")

## ----ontTable, echo = FALSE------------------------------------------------
datatable(as(ol, "data.frame"))

## --------------------------------------------------------------------------
library("rols")

## ----ol--------------------------------------------------------------------
ol <- Ontologies()
ol

## --------------------------------------------------------------------------
head(olsNamespace(ol))
ol[["go"]]

## --------------------------------------------------------------------------
go <- Ontology("go")
go

## --------------------------------------------------------------------------
gotrms <- terms(go) ## or terms("go")
gotrms
gotrms[1:10]
gotrms[["GO:0090575"]]

## --------------------------------------------------------------------------
trm <- term(go, "GO:0090575")
termId(trm)
termLabel(trm)
strwrap(termDesc(trm))

## --------------------------------------------------------------------------
parents(trm)
children(trm)

## ----propex----------------------------------------------------------------
trm <- term("uberon", "UBERON:0002107")
trm
p <- properties(trm)
p
p[[1]]
termLabel(p[[1]])

## ---- echo=FALSE-----------------------------------------------------------
alltgns <- OlsSearch(q = "trans-golgi network")

## ----tgnquery, eval = TRUE-------------------------------------------------
OlsSearch(q = "trans-golgi network")

## ----tgnquery1, eval = TRUE------------------------------------------------
OlsSearch(q = "trans-golgi network", exact = TRUE)
OlsSearch(q = "trans-golgi network", ontology = "GO")
OlsSearch(q = "trans-golgi network", ontology = "GO", exact = TRUE)

## ----tgnquery2-------------------------------------------------------------
OlsSearch(q = "trans-golgi network", ontology = "GO", rows = 200)

## ----tgnquery3-------------------------------------------------------------
(tgnq <- OlsSearch(q = "trans-golgi network", ontology = "GO"))
(tgnq <- allRows(tgnq))

## ----tgnsear4, echo=FALSE--------------------------------------------------
qry <- OlsSearch(q = "trans-golgi network", exact = TRUE)

## ----tgnquery5-------------------------------------------------------------
qry <- OlsSearch(q = "trans-golgi network", exact = TRUE)
(qry <- olsSearch(qry))

## ----tgnres----------------------------------------------------------------
(qtrms <- as(qry, "Terms"))
str(qdrf <- as(qry, "data.frame"))

## ----uterms----------------------------------------------------------------
qtrms <- unique(qtrms)
termOntology(qtrms)
termNamespace(qtrms)

## ----go.db, message=FALSE--------------------------------------------------
library("GO.db")
GOTERM[["GO:0005802"]]

## --------------------------------------------------------------------------
CVParam(name = "A user param", value = "the value")

## --------------------------------------------------------------------------
CVParam(label = "MS", accession = "MS:1000073")
CVParam(label = "MS", name ="electrospray ionization")
CVParam(label = "MS", name ="ESI") ## using a synonym

## ----si, echo=FALSE--------------------------------------------------------
print(sessionInfo(), locale = FALSE)

