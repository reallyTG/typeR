library(rrcov)


### Name: OsloTransect
### Title: Oslo Transect Data
### Aliases: OsloTransect
### Keywords: datasets

### ** Examples

data(OsloTransect)
str(OsloTransect)

##
##  Log-transform the numerical part of the data, 
##  choose the desired groups and variables and 
##  perform the classical Wilks' Lambda test
##
OsloTransect[,14:38] <- log(OsloTransect[,14:38])
grp <- OsloTransect$X.FLITHO
ind <- which(grp =="CAMSED" | grp == "GNEIS_O" |
    grp == "GNEIS_R" | grp=="MAGM")
(cwl <- Wilks.test(X.FLITHO~K+P+Zn+Cu,data=OsloTransect[ind,]))

##
## Perform now the robust MCD based Wilks' Lambda test. 
##  Use the already computed multiplication factor 'xd' and 
##  degrees of freedom 'xq' for the approximate distribution.
##

xd <- -0.003708238
xq <- 11.79073
(mcdwl <- Wilks.test(X.FLITHO~K+P+Zn+Cu,data=OsloTransect[ind,], 
    method="mcd", xd=xd, xq=xq))



