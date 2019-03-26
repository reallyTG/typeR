library(FactoClass)


### Name: cluster.carac
### Title: Cluster Characterization by Variables
### Aliases: cluster.carac
### Keywords: multivariate hplot

### ** Examples


data(DogBreeds)
DB.act <- DogBreeds[-7]  # active variables
DB.function <- subset(DogBreeds,select=7)   
cluster.carac(DB.act,DB.function,"ca",2.0)  #  nominal variables


data(iris)
iris.act <- Fac.Num(iris)$numeric
class <- Fac.Num(iris)$factor
cluster.carac(iris.act,class,"co",2.0)  #  continuous variables

# frequency variables
data(DogBreeds)
attach(DogBreeds)
weig<-table(FUNC,WEIG)
weig<-data.frame(weig[,1],weig[,2],weig[,3])
cluster.carac(weig,  row.names(weig), "fr", 2) # frequency variables
detach(DogBreeds)



