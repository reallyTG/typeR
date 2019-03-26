library(RRphylo)


### Name: retrieve.angles
### Title: Extracting a user-specified subset of the evo.dir results
### Aliases: retrieve.angles

### ** Examples

    data("DataApes")
    DataApes$PCstage->PCstage
    DataApes$Tstage->Tstage

## No test: 
    RRphylo(tree=Tstage,y=PCstage)->RR

# Case 1. "evo.dir" without performing randomization
    evo.dir(RR,angle.dimension="rates",pair.type="node",
    node=  57,random="no")->evo.p

 # Case 1.1 angles and sizes of resultant vectors between individual species and the MRCA:
  # for a focal node
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="no",focus="node",
    node=68,write2csv="no")
  # for a focal species
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="no",focus="species",
    species="Sap", write2csv="no")
  # for both focal node and species
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="no",focus="both",
    node=68,species="Sap",write2csv="no")
  # without any specific requirement
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="no",focus="none",
    write2csv="no")

 # Case 1.2 angles and sizes of vectors between individual species
 #and a fixed reference vector:
  # for a focal node
    retrieve.angles(evo.p,wishlist="angleDir",random="no",focus="node",
    node=68,write2csv="no")
  # for a focal species
    retrieve.angles(evo.p,wishlist="angleDir",random="no",focus="species",
    species="Sap", write2csv="no")
  # for both focal node and species
    retrieve.angles(evo.p,wishlist="angleDir",random="no",focus="both",
    node=68,species="Sap",write2csv="no")
  # without any specific requirement
    retrieve.angles(evo.p,wishlist="angleDir",random="no",focus="none",
    write2csv="no")

 # Case 1.3 angles between species resultant vectors:
  # for a focal node
    retrieve.angles(evo.p,wishlist="angles.between.species",random="no",
    focus="node", node=68,write2csv="no")
  # for a focal species
    retrieve.angles(evo.p,wishlist="angles.between.species",random="no",
    focus="species", species="Sap", write2csv="no")
  # for both focal node and species
    retrieve.angles(evo.p,wishlist="angles.between.species",random="no",
    focus="both",node=68,species="Sap",write2csv="no")
  # without any specific requirement
    retrieve.angles(evo.p,wishlist="angles.between.species",random="no",
    focus="none",write2csv="no")


# Case 2. "evo.dir" with performing randomization
    evo.dir(RR,angle.dimension="rates",pair.type="node",node=57,
    random="yes")->evo.p

 # Case 2.1 angles and sizes of resultant vectors between individual species and the MRCA:
  # for a focal node
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="yes",focus="node",
    node=68,write2csv="no")
  # for a focal species
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="yes", focus="species",
    species="Sap", write2csv="no")
  # for both focal node and species
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="yes",focus="both",
    node=68,species="Sap",write2csv="no")
  # without any specific requirement
    retrieve.angles(evo.p,wishlist="anglesMRCA",random="yes",focus="none",
    write2csv="no")

 # Case 2.2 angles and sizes of vectors between individual species and a fixed reference vector:
  # for a focal node
    retrieve.angles(evo.p,wishlist="angleDir",random="yes",focus="node",
    node=68,write2csv="no")
  # for a focal species
    retrieve.angles(evo.p,wishlist="angleDir",random="yes",focus="species",
    species="Sap", write2csv="no")
  # for both focal node and species
    retrieve.angles(evo.p,wishlist="angleDir",random="yes",focus="both",
    node=68, species="Sap",write2csv="no")
  # without any specific requirement
    retrieve.angles(evo.p,wishlist="angleDir",random="yes",focus="none",
    write2csv="no")

 # Case 2.3 retrieve angles between species resultant vectors:
  # for a focal node
    retrieve.angles(evo.p,wishlist="angles.between.species",random="yes",
    focus="node", node=68,write2csv="no")
  # for a focal species
    retrieve.angles(evo.p,wishlist="angles.between.species",random="yes",
    focus="species", species="Sap", write2csv="no")
  # for both focal node and species
    retrieve.angles(evo.p,wishlist="angles.between.species",random="yes",
    focus="both",node=68,species="Sap",write2csv="no")
  # without any specific requirement
    retrieve.angles(evo.p,wishlist="angles.between.species",random="yes",
    focus="none",write2csv="no")
    
## End(No test)



