library(adehabitatLT)


### Name: testNM
### Title: Null Model Approach for Animal Movement Analysis
### Aliases: NMs.randomCRW NMs.randomShiftRotation NMs.CRW NMs.randomCs
###   NMs2NMm print.NMm print.NMs testNM
### Keywords: nonparametric distribution

### ** Examples

## Not run: 
##D ########################################
##D ##
##D ## example using NMs.randomShiftRotation
##D 
##D ## first load the data:
##D data(puechcirc)
##D data(puechabonsp)
##D map <- puechabonsp$map
##D 
##D ## Consider the first animal
##D ## on an elevation map
##D anim1 <- puechcirc[1]
##D plot(anim1, spixdf=map[,1])
##D 
##D ## We define a very simple treatment function
##D ## for a NMs model: it just plots the randomized trajectory
##D ## over the study area
##D ## As required, the function takes two arguments:
##D ## x is a data.frame storing a randomized trajectory (three
##D ## columns: the x, y coordinates and the date)
##D ## par contains the map of the study area
##D 
##D myfunc <- function(x, par)
##D {
##D    par(mar = c(0,0,0,0))
##D    ## first plot the map
##D    image(par)
##D 
##D    ## then add the trajectory
##D    lines(x[,1], x[,2], lwd=2)
##D }
##D 
##D ## Then we define the null model
##D ##
##D ## We define the range of the study area where the trajectory
##D ## will be shifted:
##D rxy <- apply(coordinates(map),2,range)
##D rxy
##D 
##D ## We define the null model with 9 repetitions
##D nmo <- NMs.randomShiftRotation(na.omit(anim1), rshift = TRUE, rrot = TRUE,
##D                                rx = rxy[,1], ry = rxy[,2], treatment.func = myfunc,
##D                                treatment.par = map, nrep=9)
##D 
##D ## Then apply the null model
##D par(mfrow = c(3,3))
##D tmp <- testNM(nmo)
##D 
##D ## You may try variations, by setting rshift or rrot to FALSE, to see
##D ## the differences
##D 
##D ## Note that some of the randomized trajectories are located outside the
##D ## study area, although all barycentres are located within the X and Y
##D ## limits of this study area.
##D ## We may define a constraint function returning TRUE only if all
##D ## relocations are located within the study area
##D 
##D ## again, note that the two parameters are x and par
##D consfun <- function(x, par)
##D {
##D    ## first convert x to the class SpatialPointsDataFrame
##D    coordinates(x) <- x[,1:2]
##D 
##D    ## then use the function over from the package sp
##D    ## to check whether all points in x are located inside
##D    ## the study area
##D    ov <- over(x, geometry(map))
##D    return(all(!is.na(ov)))  
##D }
##D 
##D ## Now fit again the null model under these constraints:
##D nmo2 <- NMs.randomShiftRotation(na.omit(anim1), rshift = TRUE, rrot = TRUE,
##D                                 rx = rxy[,1], ry = rxy[,2], treatment.func = myfunc,
##D                                 treatment.par = map,
##D                                 constraint.func = consfun,
##D                                 constraint.par = map, nrep=9)
##D 
##D ## Then apply the null model
##D par(mfrow = c(3,3))
##D tmp <- testNM(nmo2)
##D 
##D ## all the relocations are now inside the study area.
##D 
##D 
##D ########################################
##D ##
##D ## example using NMs.randomCRW
##D 
##D 
##D ## We generate correlated random walks with the same starting
##D ## point as the original trajectory, the same turning angle
##D ## distribution, and the same distance between relocation
##D ## distribution. We use the same constraint function as previously
##D ## (all relocations falling within the study area), and we
##D ## use the same treatment function as previously (just plot
##D ## the result).
##D mo <- NMs.randomCRW(na.omit(anim1), rangles=TRUE, rdist=TRUE,
##D                     treatment.func = myfunc,
##D                     treatment.par = map, constraint.func=consfun,
##D                     constraint.par = map, nrep=9)
##D 
##D par(mfrow = c(3,3))
##D tmp <- testNM(mo)
##D 
##D ## Now, try a different treatment function: e.g. measure
##D ## the distance between the first and last relocation,
##D ## to test whether the animal is performing a return trip
##D myfunc2 <- function(x, par)
##D {
##D     sqrt(sum(unlist(x[1,1:2] - x[nrow(x),1:2])^2))
##D }
##D 
##D ## Now fit again the null model with this new treatment and 499 repetitions:
##D mo2 <- NMs.randomCRW(na.omit(anim1), rangles=TRUE, rdist=TRUE,
##D                      treatment.func = myfunc2,
##D                      treatment.par = map, constraint.func=consfun,
##D                      constraint.par = map, nrep=499)
##D 
##D ## Then apply the null model
##D set.seed(298) ## to make the calculation reproducible
##D rand <- testNM(mo2)
##D 
##D ## rand is a list with one element (there is one trajectory in anim1).
##D length(rand[[1]])
##D 
##D ## The first element of rand is a list of length 499 (there are 499
##D ## randomizations).
##D head(rand[[1]])
##D 
##D ## unlist this list:
##D rand2 <- unlist(rand[[1]])
##D 
##D ## calculate the observed average elevation:
##D obs <- myfunc2(na.omit(anim1)[[1]][,1:3], map)
##D 
##D ## and performs a randomization test:
##D (rt <- as.randtest(rand2, obs, alter="less"))
##D plot(rt)
##D 
##D ## Comparing to a model where the animal is moving randomly, and based
##D ## on the chosen criterion (distance between the first and last
##D ## relocation), we can see that the distance between the first and last
##D ## relocation is rarely observed.  It seems to indicate that the animal
##D ## tends to perform a loop.
##D 
##D 
##D 
##D ########################################
##D ##
##D ## example using NMs2NMm
##D 
##D ## Given the previous results, we may try to see if all
##D ## the trajectories in puechcirc are characterized by return
##D ## trips
##D ## We need a NMm approach. Because we have 3 burst in puechcirc
##D ## we need a summary criterion. For example, the mean
##D ## distance between the first and last relocation.
##D 
##D ## We program a treatment function: it also takes two arguments, but x
##D ## is now an object of class "ltraj" ! 
##D ## par is needed, but will not be used in the function
##D 
##D myfunm <- function(x, par)
##D {
##D    di <- unlist(lapply(x, function(y) {
##D       sqrt(sum(unlist(y[1,1:2] - y[nrow(y),1:2])^2))
##D    }))
##D    return(mean(di))
##D }
##D 
##D ## Now, prepare the NMs object: we do not indicate any treatment
##D ## function (it would not be taken into account when NMs would be
##D ## transformed to NMm).  However, we keep the constraint function
##D ## the simulated trajectories should fall within the study area
##D mo2s <- NMs.randomCRW(na.omit(puechcirc), constraint.func=consfun,
##D                       constraint.par = map)
##D 
##D ## We convert this object to NMm, and we pass the treatment function
##D mo2m <- NMs2NMm(mo2s, treatment.func = myfunm, nrep=499)
##D 
##D ## and we fit the model
##D set.seed(908)
##D resu <- testNM(mo2m)
##D 
##D ## We calculate the observed mean distance between the
##D ## first and last relocation
##D obs <- myfunm(na.omit(puechcirc))
##D 
##D ## and performs a randomization test:
##D (rt <- as.randtest(unlist(resu), obs, alter="less"))
##D plot(rt)
##D 
##D ## The test is no longer significant
##D 
##D 
##D ########################################
##D ##
##D ## example using NMs.randomCs
##D 
##D ## Consider this sample of 5 capture sites:
##D cs <- list(c(701184, 3161020), c(700164, 3160473),
##D            c(698797, 3159908), c(699034, 3158559),
##D            c(701020, 3159489))
##D image(map)
##D lapply(cs, function(x) points(x[1], x[2], pch=16))
##D 
##D ## Consider this sample of distances:
##D dist <- c(100, 200, 150)
##D 
##D ## change the treatment function so that the capture sites are showed as
##D ## well. Now, par is a list with two elements: the first one is the map
##D ## and the second one is the list of capture sites
##D 
##D myfunc <- function(x, par)
##D {
##D    par(mar = c(0,0,0,0))
##D    ## first plot the map
##D    image(par[[1]])
##D 
##D    lapply(par[[2]], function(x) points(x[1], x[2], pch=16))
##D 
##D    ## then add the trajectory
##D    lines(x[,1], x[,2], lwd=2)
##D }
##D 
##D 
##D ## Now define the null model, with the same constraints
##D ## and treatment as before
##D mod <- NMs.randomCs(na.omit(anim1), newCs=cs, newDistances=dist,
##D                     treatment.func=myfunc, treatment.par=list(map, cs),
##D                     constraint.func=consfun, constraint.par=map,
##D                     nrep=9)
##D 
##D ## apply the null model
##D par(mfrow = c(3,3))
##D tmp <- testNM(mod)
## End(Not run)





