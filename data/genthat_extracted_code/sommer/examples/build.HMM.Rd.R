library(sommer)


### Name: build.HMM
### Title: Build a hybrid marker matrix using parental genotypes
### Aliases: build.HMM

### ** Examples

####=========================================####
#### use Technow data as example
####=========================================####
data(DT_technow)
M.flint <- Mf # Marker matrix Flint
M.dent <- Md # Marker matrix Dent

## first get all possible hybrids
res1 <- build.HMM(M.dent, M.flint, 
                  return.combos.only = TRUE)
head(res1$data.used)

## build the marker matrix for the first 50 hybrids
res2 <- build.HMM(M.dent, M.flint,
                 custom.hyb = res1$data.used[1:50,]
                 )
res2$HMM.add[1:5,1:5]
res2$HMM.dom[1:5,1:5]

## now you can use the A.mat(), D.mat() and E.mat() functions
# M <- res2$HMM.add
# A <- A.mat(M)
# D <- D.mat(M)




