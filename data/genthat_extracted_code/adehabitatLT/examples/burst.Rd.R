library(adehabitatLT)


### Name: burst
### Title: ID, Bursts and infolocs of an Object of Class ltraj
### Aliases: burst id burst<- id<- removeinfo infolocs infolocs<-
### Keywords: programming

### ** Examples

data(puechcirc)
puechcirc

## To see the ID and the burst
id(puechcirc)
burst(puechcirc)

## Change the burst
burst(puechcirc) <- c("glou", "toto", "titi")
puechcirc

burst(puechcirc)[2] <- "new name"
puechcirc

## Change the ID
id(puechcirc)[id(puechcirc)=="CH93"] <- "WILD BOAR"
puechcirc

## example of an object with an attribute "infolocs"
data(capreochiz)
head(capreochiz)

## Create an object of class "ltraj"
cap <- as.ltraj(xy = capreochiz[,c("x","y")], date = capreochiz$date,
                id = "Roe.Deer", typeII = TRUE,
                infolocs = capreochiz[,4:8])
cap
cap2 <- removeinfo(cap)
cap2

infolocs(cap)






