library(RRphylo)


### Name: search.trend
### Title: Searching for evolutionary trends in phenotypes and rates
### Aliases: search.trend

### ** Examples

 ## No test: 
data("DataOrnithodirans")
DataOrnithodirans$treedino->treedino
DataOrnithodirans$massdino->massdino

# Extract Pterosaurs tree and data
  library(ape)
  extract.clade(treedino,748)->treeptero
  massdino[match(treeptero$tip.label,names(massdino))]->massptero
  massptero[match(treeptero$tip.label,names(massptero))]->massptero

# Case 1. "RRphylo" whitout accounting for the effect of a covariate
  RRphylo(tree=treeptero,y=log(massptero))->RRptero

 # Case 1.1. "search.trend" whitout indicating nodes to be tested for trends
   search.trend(RR=RRptero, y=log(massptero), nsim=100, clus=0.5,
   foldername=tempdir(),cov=NULL,ConfInt=FALSE,node=NULL)

 # Case 1.2. "search.trend" indicating nodes to be specifically tested for trends
    search.trend(RR=RRptero, y=log(massptero), nsim=100, node=143, clus=0.5,
    foldername=tempdir(),cov=NULL,ConfInt=FALSE)


# Case 2. "RRphylo" accounting for the effect of a covariate
 # "RRphylo" on the covariate in order to retrieve ancestral state values
   RRphylo(tree=treeptero,y=log(massptero))->RRptero
   c(RRptero$aces,log(massptero))->cov.values
   names(cov.values)<-c(rownames(RRptero$aces),names(massptero))
   RRphylo(tree=treeptero,y=log(massptero),cov=cov.values)->RRpteroCov

 # Case 2.1. "search.trend" whitout indicating nodes to be tested for trends
   search.trend(RR=RRpteroCov, y=log(massptero), nsim=100, clus=0.5,
   foldername=tempdir(),ConfInt=FALSE,cov=cov.values)

 # Case 2.2. "search.trend" indicating nodes to be specifically tested for trends
   search.trend(RR=RRpteroCov, y=log(massptero), nsim=100, node=143, clus=0.5,
   foldername=tempdir(),ConfInt=FALSE,cov=cov.values)
## End(No test)



