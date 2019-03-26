library(BiodiversityR)


### Name: diversityresult
### Title: Alternative Diversity Results
### Aliases: diversityresult diversitycomp diversityvariables
### Keywords: multivariate

### ** Examples


library(vegan)
data(dune.env)
data(dune)

diversityresult(dune, y=NULL, index="Shannon", method="each site", 
    sortit=TRUE, digits=5)
diversityresult(dune, y=dune.env, factor="Management", level="NM", 
    index="Shannon", method="each site", 
    sortit=TRUE, digits=5)
diversityresult(dune, y=NULL, index="Shannon", method="pooled", digits=5)
diversityresult(dune, y=dune.env, factor="Management", level="NM", 
    index="Shannon", method="pooled", digits=5)
diversityresult(dune, y=NULL, index="Shannon", method="mean", 
    digits=5)
diversityresult(dune, y=NULL, index="Shannon", method="sd", 
    digits=5)
diversityresult(dune, y=NULL, index="Shannon", method="jackknife", 
    digits=5)
diversityresult(dune, y=dune.env, factor="Management", level="NM", 
    index="Shannon", method="jackknife", digits=5)

diversitycomp(dune, y=dune.env, factor1="Moisture", index="Shannon",
    method="pooled", sortit=TRUE)
diversitycomp(dune, y=dune.env, factor1="Moisture", index="Shannon",
    method="mean", sortit=TRUE)
diversitycomp(dune, y=dune.env, factor1="Management", index="Shannon",
    method="jackknife", sortit=TRUE)

diversitycomp(dune, y=dune.env, factor1="Management", factor2="Moisture", 
    index="Shannon", method="pooled", digits=6)
diversitycomp(dune, y=dune.env, factor1="Management", factor2="Moisture", 
    index="Shannon", method="mean", digits=6)



