library(simstudy)


### Name: genOrdCat
### Title: Generate ordinal categorical data
### Aliases: genOrdCat

### ** Examples

#### Set definitions

def1 <- defData(varname = "male", formula = 0.45, dist = "binary", id = "idG")
def1 <- defData(def1, varname = "z", formula = "1.2*male", dist = "nonrandom")

#### Generate data

set.seed(20)

dx <- genData(1000, def1)

probs<-c(0.40, 0.25, 0.15)
dx <- genOrdCat(dx, adjVar = "z", probs, catVar = "grp")




