library(overlapptest)


### Name: test.intersection
### Title: Test Overlapping of Polygons Against Random Rotation
### Aliases: test.auto.intersection test.intersection
###   test.auto.intersection.p test.intersection.p
### Keywords: spatial

### ** Examples


data(Astragalus)
data(Sesleria)
# Test overlapping between Astragalus individuals
  # Ideally nsim should be at least 199
   Astragalus.test<- test.auto.intersection(Astragalus, nsim=19)
   # Observed overlapping area
   Astragalus.test[1]
   # p-value (negative value indicates that the observed overlapping is smaller 
   # than expected)
   pval(Astragalus.test)
   
# Test overlapping between Astragalus  and Sesleria individuals.
# Here, Sesleria is the accesory species (its individuals are kept fixed during the
# test) and Astragalus  the focal one (its individuals are rotated)
# Ideally nsim should be at least 199
   Sesleria.Astragalus.test<- test.intersection(ventana1= Sesleria, 
                                                   ventana2= Astragalus, nsim=19)
   # Observed overlapping area
   Sesleria.Astragalus.test[1]
   # p-value (negative value indicates that the observed overlapping is smaller
   # than expected)
   pval(Sesleria.Astragalus.test)
   
## No test: 
 
# Reducing computing burden when making repetitive testing
# First, put all the polygonal regions in a list, i.e.
 owins<- list(Astragalus, Sesleria)
 
 # compute diameters and centroids of the individual polygons 
 # in each polygonal region
 
centroids<- list()
diams<- list()
  for ( i in 1: length(owins)){
    cd<- centroidiam(owins[[i]])
    centroids[[i]] <- cd$centroids
    diams[[i]] <- cd$diams
}

# set the number of simulations for each test
nsim<-199

# create an array to store the results
result <- array(NA, dim=c(length(owins),length(owins),nsim+1))

t0<-Sys.time()
for ( i in 1: length(owins)){
   for ( j in 1: length(owins)){
     cat(i,j,"\n")
       if(j!=i) result[i,j,] <- test.intersection(owins[[i]], owins[[j]], nsim=nsim,
		centroides1=centroids[[i]], diametros1=diams[[i]],
		centroides2=centroids[[j]], diametros2=diams[[j]]) else
		result[i,j,] <-  test.auto.intersection(owins[[i]], nsim=nsim,
		centroides1=centroids[[i]], diametros1=diams[[i]])
   }
}
 Sys.time()-t0
 
 # observed values (focal species in columns)
 (observed<-  t(result[,,1]))
 # p-values
 tabla.p<- apply(result,c(1,2),pval)
 (p_values <- t(tabla.p))
 
 # Compare with parallelized versions:
  
# create an array to store the result.ps
result.p<- array(NA, dim=c(length(owins),length(owins),nsim+1))

t0<-Sys.time()
for ( i in 1: length(owins)){
   for ( j in 1: length(owins)){
     cat(i,j,"\n")
       if(j!=i) result.p[i,j,] <- test.intersection.p(owins[[i]], owins[[j]], nsim=nsim,
		centroides1=centroids[[i]], diametros1=diams[[i]],
		centroides2=centroids[[j]], diametros2=diams[[j]]) else
		result.p[i,j,] <-  test.auto.intersection.p(owins[[i]], nsim=nsim,
		centroides1=centroids[[i]], diametros1=diams[[i]])
   }
}
 Sys.time()-t0
 
 # observed values (focal species in columns)
 (observed.p<-  t(result.p[,,1]))
 # p-values
 tabla.p.p<- apply(result.p,c(1,2),pval)
 (p_values.p <- t(tabla.p.p))
 
 
## End(No test)
 



