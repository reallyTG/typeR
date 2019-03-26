library(paleofire)


### Name: pfMinMax
### Title: MiniMax transformation of a charcoal serie
### Aliases: pfMinMax

### ** Examples


## Retrieve a site
ID=pfSiteSel(site_name=="Pas-de-Fond")
## Or a group of sites
ID=pfSiteSel(continent=="Africa")

## Extract data
A=pfExtract(ID)

## Plot the first site raw charcoal data
par(mfrow=c(1,2))
plot(A[A[,1]==ID$id_site[1],3],A[A[,1]==ID$id_site[1],4],type="l",main=ID$site_name[1],
     xlab="Age",ylab="raw Char")
## Minimax transformation
B=pfMinMax(A[A[,1]==ID$id_site[1],4])
## Plot the first site Minimax transformed charcoal data
plot(A[A[,1]==ID$id_site[1],3],B,type="l",main=ID$site_name[1],
     xlab="Age",ylab="Minimax")




