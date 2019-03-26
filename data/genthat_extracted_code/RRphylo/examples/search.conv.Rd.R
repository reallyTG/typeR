library(RRphylo)


### Name: search.conv
### Title: Searching for morphological convergence among species and clades
### Aliases: search.conv

### ** Examples

  data("DataUng")
  DataUng$PCscoresung->PCscoresung
  DataUng$treeung->treeung
  DataUng$stateung->stateung

  data("DataFelids")
  DataFelids$PCscoresfel->PCscoresfel
  DataFelids$treefel->treefel

  ## No test: 
  search.conv(tree=treeung, y=PCscoresung, state=stateung, foldername = tempdir())

  RRphylo(treefel,PCscoresfel)->RRfel
  search.conv(RR=RRfel, y=PCscoresfel, min.dim=5, foldername = tempdir())
  
## End(No test)



