library(RRphylo)


### Name: evo.dir
### Title: Phylogenetic vector analysis of phenotypic change
### Aliases: evo.dir

### ** Examples


  data("DataApes")
  DataApes$PCstage->PCstage
  DataApes$Tstage->Tstage
## No test: 
  RRphylo(tree=Tstage,y=PCstage)->RR
# Case 1. Without performing randomization test

 # Case 1.1 Computing angles between rate vectors
  # for each possible couple of species descending from node 72
    evo.dir(RR,angle.dimension="rates",pair.type="node",node=72 ,
    random="no")
  # for a given couple of species
    evo.dir(RR,angle.dimension="rates",pair.type="tips",
    pair= c("Sap_1","Tro_2"),random="no")

 # Case 1.2 computing angles between phenotypic vectors provided by the user
  # for each possible couple of species descending from node 72
    evo.dir(RR,angle.dimension="phenotypes",y.type="original",
    y=PCstage,pair.type="node",node=72,random="no")
  # for a given couple of species
    evo.dir(RR,angle.dimension="phenotypes",y.type="original",
    y=PCstage,pair.type="tips",pair=c("Sap_1","Tro_2"),random="no")

 # Case 1.3 computing angles between phenotypic vectors produced by "RRphylo"
  # for each possible couple of species descending from node 72
    evo.dir(RR,angle.dimension="phenotypes",y.type="RR",
    pair.type="node",node=72,random="no")
  # for a given couple of species
    evo.dir(RR,angle.dimension="phenotypes",y.type="RR",
    pair.type="tips",pair=c("Sap_1","Tro_2"),random="no")


# Case 2. Performing randomization test

 # Case 2.1 Computing angles between rate vectors
  # for each possible couple of species descending from node 72
    evo.dir(RR,angle.dimension="rates",pair.type="node",node=72 ,
    random="yes",nrep=100)

  # for a given couple of species
    evo.dir(RR,angle.dimension="rates",pair.type="tips",
    pair= c("Sap_1","Tro_2"),random="yes",nrep=100)

 # Case 2.2 computing angles between phenotypic vectors provided by the user
  # for each possible couple of species descending from node 72
    evo.dir(RR,angle.dimension="phenotypes",y.type="original",
    y=PCstage,pair.type="node",node=72,random="yes",nrep=100)

  # for a given couple of species
    evo.dir(RR,angle.dimension="phenotypes",y.type="original",
    y=PCstage,pair.type="tips",pair=c("Sap_1","Tro_2"),random="yes",nrep=100)

 # Case 2.3 computing angles between phenotypic vectors produced by "RRphylo"
  # for each possible couple of species descending from node 72
    evo.dir(RR,angle.dimension="phenotypes",y.type="RR",
    pair.type="node",node=72,random="yes",nrep=100)

  # for a given couple of species
    evo.dir(RR,angle.dimension="phenotypes",y.type="RR",
    pair.type="tips",pair=c("Sap_1","Tro_2"),random="yes",nrep=100)
    
## End(No test)



