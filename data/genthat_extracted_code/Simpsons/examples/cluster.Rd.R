library(Simpsons)


### Name: cluster
### Title: Extract clustered subsets
### Aliases: cluster

### ** Examples

## Not run: 
##D #example 2. Here we estimate the relationship between 'Coffee' and #'Neuroticism'. 
##D #As opposed to example 1, we have not measured any possible clustering #identifiers 
##D #such as gender, so we want to estimate whether there is evidence for #clustering based 
##D #only on the data we measured: Coffee and Neuroticism.
##D 
##D #generating data 
##D Coffee1=rnorm(100,100,15)
##D Neuroticism1=(Coffee1*.8)+rnorm(100,15,8)
##D g1=cbind(Coffee1, Neuroticism1)
##D Coffee2=rnorm(100,170,15)
##D Neuroticism2=(300-(Coffee2*.8)+rnorm(100,15,8))
##D g2=cbind(Coffee2, Neuroticism2)
##D Coffee3=rnorm(100,140,15)
##D Neuroticism3=(200-(Coffee3*.8)+rnorm(100,15,8))
##D g3=cbind(Coffee3, Neuroticism3)
##D data2=data.frame(rbind(g1,g2,g3))
##D colnames(data2) <- c("Coffee","Neuroticism")
##D 
##D example2=Simpsons(Coffee,Neuroticism,data=data2) 
##D cluster(example2,2) #extracts data belonging to cluster 2
##D cluster(example2,c(1,3) #extracts all datapoints belonging to clusters 1 and 3
## End(Not run)



