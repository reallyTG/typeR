library(lmf)


### Name: eigenl
### Title: Calculating lambda, u and v
### Aliases: eigenl

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#The uniue age classes
unique.age <- unique(sparrowdata$age)
#Estimate the projection matrix
pro.comp <- procomp(a = sparrowdata, uage = unique.age)
projection.matrix <- promat(pc = pro.comp, nage = length(unique.age))
#Estimate lambda, u and v
eigenl(pm = projection.matrix)



