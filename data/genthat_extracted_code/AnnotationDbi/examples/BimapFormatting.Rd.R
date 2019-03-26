library(AnnotationDbi)


### Name: BimapFormatting
### Title: Formatting a Bimap as a list or character vector
### Aliases: BimapFormatting as.list as.list,FlatBimap-method
###   as.list,Bimap-method as.list.Bimap as.list,IpiAnnDbMap-method
###   as.list,AgiAnnDbMap-method as.list,GoAnnDbBimap-method
###   as.list,GOTermsAnnDbBimap-method as.character,AnnDbBimap-method
###   as.character,FlatBimap-method
### Keywords: methods

### ** Examples

  library(hgu95av2.db)
  as.list(hgu95av2CHRLOC)[1:9]
  as.list(hgu95av2ENTREZID)[1:9]
  as.character(hgu95av2ENTREZID)[1:9]



