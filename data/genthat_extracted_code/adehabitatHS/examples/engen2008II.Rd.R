library(adehabitatHS)


### Name: engen2008II
### Title: Measuring Habitat Selection Using the Method of Engen et al.
###   (2008)
### Aliases: engen2008II engen2008I print.engenetalI print.engenetalII
### Keywords: multivariate

### ** Examples


## Not run: 
##D 
##D #################################
##D #################################
##D #################################
##D 
##D ## Practical use of engen2008II
##D 
##D data(puechabonsp)
##D map <- puechabonsp$map
##D 
##D ## Removes the aspect (no factor allowed in the function)
##D slot(map,"data")$Aspect <- NULL
##D 
##D ## engen2008II:
##D avail <- slot(map, "data")
##D use <- join(puechabonsp$relocs, map)
##D id <- slot(puechabonsp$relocs, "data")$Name
##D 
##D ## This function can be very long:
##D engen2008II(use, avail, id, nsimra=10)
##D 
##D 
##D 
##D 
##D ## Practical use of engen2008I
##D 
##D data(lynxjura)
##D ma <- lynxjura$map
##D lo <- lynxjura$locs
##D av <- slot(ma, "data")
##D us <- join(lo, ma)
##D us <- us[!is.na(us[,1]),]
##D 
##D ## Idem, be patient here:
##D engen2008I(us, av, nsimra=10)
##D 
##D 
##D 
##D 
##D #################################
##D #################################
##D #################################
##D ##
##D ##  For a deeper discussion on
##D ##  this method... a simulation:
##D 
##D 
##D 
##D #################################
##D ##
##D ## First, simulation of a dataset
##D ## copy and paste this part into R,
##D ## but skip the reading of the
##D ## comments if you are not interested
##D ## into this simulation
##D 
##D ## simulate the available points
##D 
##D set.seed(235)
##D av <- cbind(rnorm(1000, mean=0, sd=3), rnorm(1000, mean=0, sd=0.5))
##D tt <- cbind(c(cos(-pi/4),sin(-pi/4)),c(cos(pi/4), sin(pi/4)))
##D av <- as.data.frame(as.matrix(av)%*%tt)
##D 
##D ## simulate the used points: we simulate a selection on the first
##D ## principal component of the PCA of the data.frame describing the
##D ## availability. In other words, we simulate the case where the
##D ## habitat selection occurs on the "common part" of the two habitat
##D ## variable (no preference for one particular variable).
##D 
##D us <- do.call("rbind", lapply(1:5, function(i) {
##D     us1 <- cbind(rnorm(30, mean=rnorm(1, -4, 1), sd=0.5),
##D                  rnorm(30, mean=rnorm(1, 0, 0.5), sd=0.2))
##D 
##D     return(us1%*%tt)
##D }))
##D colnames(us) <- colnames(av) <- c("var1", "var2")
##D id <- gl(5,30)
##D 
##D 
##D #################################
##D ##
##D ## Study of the habitat selection on these data
##D ## The data are:
##D ## - us: a matrix containing the used sites for two
##D ##       habitat variables
##D ## - av: a matrix containing the available sites for two
##D ##       habitat variables
##D ## - id: a vector containing the id of 5 animals
##D 
##D ## First illustrate the use and availability of the two variables:
##D 
##D plot(av, xlab="Habitat variable 1", ylab="Habitat variable 2",
##D      col="grey", pch=16)
##D lius <- split(as.data.frame(us), id)
##D junk <- lapply(1:5, function(i) points(lius[[i]], pch=16, col=i))
##D 
##D ## -----> ***It is very clear that there is a selection***:
##D ## the animals select the low values of both habitat variables.
##D ## (this is what we actually simulated)
##D 
##D 
##D ## Now perform the method of Engen et al. (2008):
##D engen2008II(us, av, id)
##D 
##D 
##D ## Surprisingly, the method seems to fail to identify the clear
##D ## habitat selection identified graphically...
##D ##
##D ## In fact, it does not fail:
##D ## this method identifies the part of habitat selection that is clearly
##D ## attributable to a given variable.  Here the animals select the
##D ## the common factor expressed in the two variables, and it is impossible
##D ## to identify whether the selection is due only to the variable 1 or to
##D ## the variable 2: it is caused by both variable simultaneously.
##D ## Once the selection on the variable 2 (including the common part)
##D ## has been removed, there is no longer appearant selection on
##D ## variable 1.  Once the selection caused by the variable 1
##D ## (including the common part) has been removed, there is no
##D ## longer selection on variable 2...
##D ##
##D ## For this reason, Engen et al. recommended to use this method
##D ## concurrently with other factor analyses of the habitat selection
##D ## such as madifa, kselect, niche (in ade4 package), etc.
##D ##
##D ## Note also the strong correlation between the value of two random
##D ## points used by a given animal. This indicates a strong variability
##D ## among animals...
##D 
##D 
##D 
## End(Not run)





