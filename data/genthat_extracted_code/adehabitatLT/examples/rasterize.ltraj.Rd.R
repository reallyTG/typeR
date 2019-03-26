library(adehabitatLT)


### Name: rasterize.ltraj
### Title: Rasterize a Trajectory
### Aliases: rasterize.ltraj
### Keywords: spatial

### ** Examples


data(puechabonsp)
data(puechcirc)

## Show the trajectories on the map
plot(puechcirc, spixdf = puechabonsp$map)

## rasterize the trajectories
ii <- rasterize.ltraj(puechcirc, puechabonsp$map)

## show, e.g. the first rasterized trajectory
tr1 <- ii[[1]]
head(tr1)
plot(tr1)

## so, for example, to see the pixels traversed by the third step of the
##  trajectory
points(tr1[tr1[[1]]==3,], col="red")

## So, if we want to calculate the mean elevation for each step:
mel <- over(tr1, puechabonsp$map)
mo <- tapply(mel[[1]], tr1[[1]], mean)
plot(mo, ty="l")

## It is clear that elevation decreases at the middle of the monitoring
## and increases again at the end (the animal sleeps on the plateau
## and goes down in the vineyards during the night).

## Now define an infolocs component in puechcirc corresponding to the
## mean elevation:

val <- lapply(1:length(ii), function(i) {

    ## get the rasterized trajectory
    tr <- ii[[i]]

    ## get the pixels of the map
    mel <- over(tr, puechabonsp$map)

    ## calculate the mean elevation
    mo <- tapply(mel[[1]], tr[[1]], mean)

    ## prepare the output
    elev <- rep(NA, nrow(puechcirc[[i]]))

    ## place the average values at the right place
    ## names(mo) contains the step number (i.e. relocation
    ## number +1)
    elev[as.numeric(names(mo))+1] <- mo

    ## Checks that the row.names are the same for
    ## the result and the ltraj component
    df <- data.frame(elevation = elev)
    row.names(df) <- row.names(puechcirc[[i]])

    return(df)
})

## define the infolocs component
infolocs(puechcirc) <- val

## and draw the trajectory
plotltr(puechcirc, "elevation")




