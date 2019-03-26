library(adehabitatLT)


### Name: as.ltraj
### Title: Working with Trajectories in 2D Space: the Class ltraj
### Aliases: as.ltraj ltraj print.ltraj summary.ltraj rec
### Keywords: spatial

### ** Examples


data(puechabonsp)
locs <- puechabonsp$relocs
head(locs)
xy <- coordinates(locs)
df <- as.data.frame(locs)
id <- df[,1]

######################################################
##
## Example of a trajectory of type I (time not recorded)

(litrI <- as.ltraj(xy, id = id, typeII=FALSE))
plot(litrI)

## The components of the object of class "ltraj"
head(litrI[[1]])


######################################################
##
## Example of a trajectory of type II (time recorded)


### Conversion of the date to the format POSIX
da <- as.character(df$Date)
da <- as.POSIXct(strptime(as.character(df$Date),"%y%m%d", tz="Europe/Paris"))


### Creation of an object of class "ltraj", with for 
### example the first animal
(tr1 <- as.ltraj(xy[id=="Brock",],
                 date = da[id=="Brock"],
                 id="Brock"))

## The components of the object of class "ltraj"
head(tr1[[1]])

## With all animals
(litr <- as.ltraj(xy, da, id = id))

## Change something manually in the first burst:
head(litr[[1]])
litr[[1]][3,"x"] <- 700000

## Recompute the trajectory
litr <- rec(litr)
## Note that descriptive statistics have changed (e.g. dx)
head(litr[[1]])



######################################################
##
## Example of a trajectory of type II (time recorded)
## with an infolocs attribute:

data(capreochiz)
head(capreochiz)

## Create an object of class "ltraj"
cap <- as.ltraj(xy = capreochiz[,c("x","y")], date = capreochiz$date,
                id = "Roe.Deer", typeII = TRUE,
                infolocs = capreochiz[,4:8])
cap





