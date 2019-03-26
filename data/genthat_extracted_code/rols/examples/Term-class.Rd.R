library(rols)


### Name: Term-class
### Title: Class '"Term"'
### Aliases: Term class:Term Term-class Terms class:Terms Terms-class
###   termLabel termLabel,Term-method termLabel,Terms-method termNamespace
###   termNamespace,Term-method termNamespace,Terms-method termOntology
###   termOntology,Term-method termOntology,Terms-method termSynonym
###   termSynonym,Term-method termSynonym,Terms-method termDesc
###   termDesc,Term-method termDesc,Terms-method termPrefix
###   termPrefix,Term-method termPrefix,Terms-method show,Term-method
###   show,Terms-method termId termId,Term-method termId,Terms-method
###   isObsolete isObsolete,Term-method isObsolete,Terms-method isRoot
###   isRoot,Term-method isRoot,Terms-method coerce,Term,data.frame-method
###   coerce,Terms,data.frame-method as.Term.data.frame as.Terms.data.frame
###   terms term term,Ontology,character-method
###   term,character,character-method terms,Ontology-method
###   terms,character-method children parents ancestors descendants partOf
###   derivesFrom unique,Terms-method length,Terms-method
###   lapply,Terms-method [,Terms-method [[,Terms-method
###   all.equal,Term,Term-method all.equal,Terms,Terms-method
### Keywords: classes

### ** Examples


## (all) terms
(gotrms <- terms("go", pagesize = 10000))

## Not run: 
##D     ## or, using on ontology object
##D     go <- Ontology("go")
##D     gotrms <- terms(go, pagesize = 10000)
## End(Not run)

as(gotrms[1:10], "data.frame") ## data,frame with 10 rows

## (one) term
(trm <- gotrms[[1]])
termPrefix(trm)
gotrms[1:3]
gotrms[["GO:0005230"]]

as(trm, "data.frame") ## data,frame with 1 row

## using an Ontology object
go <- Ontology("GO")
term(go, "GO:0032801")
## using an ontology prefix
term("GO", "GO:0032801")

isObsolete(gotrms[["GO:0005230"]])
isObsolete(gotrms[["GO:0005232"]])

isRoot(gotrms[["GO:0005230"]])
isRoot(gotrms[["GO:0005232"]])

i <- isRoot(gotrms) & !isObsolete(gotrms)
gotrms[i]
for (ii in which(i))
    show(gotrms[[ii]])

## or, directly querying the ontology
olsRoot(go)

parents(trm)
ancestors(trm)
children(trm)
descendants(trm)

partOf(gotrms[["GO:0044429"]])
partOf(term("BTO", "BTO:0000142"))

derivesFrom(term("BTO", "BTO:0002600"))
derivesFrom(term("BTO", "BTO:0001023"))




