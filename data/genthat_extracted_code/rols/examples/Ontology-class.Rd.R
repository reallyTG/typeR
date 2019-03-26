library(rols)


### Name: Ontology-class
### Title: Class '"Ontology"'
### Aliases: Ontology class:Ontology Ontology-class Ontologies
###   class:Ontologies Ontologies-class Ontologies,missing-method
###   Ontologies,numeric-method Ontology,Ontology-method
###   Ontology,character-method olsDesc olsDesc,character-method
###   olsDesc,Ontology-method olsDesc,Ontologies-method olsPrefix
###   olsPrefix,character-method olsPrefix,Ontology-method
###   olsPrefix,Ontologies-method olsStatus olsStatus,character-method
###   olsStatus,Ontology-method olsStatus,Ontologies-method olsNamespace
###   olsNamespace,character-method olsNamespace,Ontology-method
###   olsNamespace,Ontologies-method olsRoot olsRoot,character-method
###   olsRoot,Ontology-method olsRoot,Ontologies-method olsTitle
###   olsTitle,character-method olsTitle,Ontology-method
###   olsTitle,Ontologies-method olsVersion olsVersion,Ontology-method
###   olsVersion,character-method olsVersion,Ontologies-method olsLoaded
###   olsLoaded,Ontology-method olsLoaded,character-method
###   olsLoaded,Ontologies-method olsUpdated olsUpdated,Ontology-method
###   olsUpdated,character-method olsUpdated,Ontologies-method
###   show,Ontology-method show,Ontologies-method length,Ontologies-method
###   lapply,Ontologies-method [,Ontologies-method [[,Ontologies-method
###   coerce,Ontologies,data.frame-method coerce,Ontologies,list-method
###   all.equal,Ontologies,Ontologies-method
###   all.equal,Ontology,Ontology-method
### Keywords: classes

### ** Examples

## Get all ontolgies
ol <- Ontologies()
ol

head(as(ol, "data.frame"))
length(ol)

## Individual ontologies
(go <- ol[["go"]]) 
(efo <- ol[["efo"]])

## some basic information
olsVersion(go)
olsDesc(go)
olsTitle(go)
olsPrefix(go)
olsNamespace(go)

olsRoot(go)

## works with Ontology objects or their namespace
identical(olsRoot("go"), olsRoot(go))
identical(olsVersion("go"), olsVersion(go))

## Directly initialise a single ontology
go1 <- Ontology("go") ## using the namespace (preferred)
go2 <- Ontology("GO") ## using the prefix (see Details)
all.equal(go, go1)
all.equal(go, go2)



