library(RRphylo)


### Name: angle.matrix
### Title: Ontogenetic shape vectors analysis
### Aliases: angle.matrix

### ** Examples

  data("DataApes")
  DataApes$PCstage->PCstage
  DataApes$Tstage->Tstage
  DataApes$CentroidSize->CS

  ## No test: 
  RRphylo(tree=Tstage,y=PCstage)->RR
# Case 1. without accounting for the effect of a covariate

 # Case 1.1 selecting shape variables that show significant relationship with age
  # on phenotypic vectors
    angle.matrix(RR,node=72,Y=PCstage,select.axes="yes",type="phenotypes")
  # on rates vectors
    angle.matrix(RR,node=72,Y=PCstage,select.axes="yes",type="rates")

 # Case 1.2 using all shape variables
  # on phenotypic vectors
    angle.matrix(RR,node=72,Y=PCstage,select.axes="no",type="phenotypes")
  # on rates vectors
    angle.matrix(RR,node=72,Y=PCstage,select.axes="no",type="rates")


# Case 2. accounting for the effect of a covariate (on rates vectors only)

 # Case 2.1 selecting shape variables that show significant relationship with age
   angle.matrix(RR,node=72,Y=PCstage,select.axes="yes",type="rates", cova=CS)


 # Case 2.2 using all shape variables
   angle.matrix(RR,node=72,Y=PCstage,select.axes="no",type="rates",cova=CS)
  
## End(No test)



