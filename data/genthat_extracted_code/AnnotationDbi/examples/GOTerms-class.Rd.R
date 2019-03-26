library(AnnotationDbi)


### Name: GOTerms-class
### Title: Class "GOTerms"
### Aliases: class:GOTerms GOTerms-class GOTerms initialize,GOTerms-method
###   GOID,GOTerms-method GOID,GOTermsAnnDbBimap-method
###   GOID,character-method Term Term,GOTerms-method
###   Term,GOTermsAnnDbBimap-method Term,character-method Ontology
###   Ontology,GOTerms-method Ontology,GOTermsAnnDbBimap-method
###   Ontology,character-method Definition Definition,GOTerms-method
###   Definition,GOTermsAnnDbBimap-method Definition,character-method
###   Synonym Synonym,GOTerms-method Synonym,GOTermsAnnDbBimap-method
###   Synonym,character-method Secondary Secondary,GOTerms-method
###   Secondary,GOTermsAnnDbBimap-method Secondary,character-method
###   show,GOTerms-method
### Keywords: methods classes

### ** Examples

  gonode <- new("GOTerms", GOID="GO:1234567", Term="Test", Ontology="MF",
                          Definition="just for testing")
  GOID(gonode)
  Term(gonode)
  Ontology(gonode)

  ##Or you can just use these methods on a GOTermsAnnDbBimap
## Not run: 
##D ##I want to show an ex., but don't want to require GO.db
##D   require(GO.db)
##D   FirstTenGOBimap <- GOTERM[1:10] ##grab the 1st ten
##D   Term(FirstTenGOBimap)
##D 
##D   ##Or you can just use GO IDs directly
##D   ids = keys(FirstTenGOBimap)
##D   Term(ids)
## End(Not run)



