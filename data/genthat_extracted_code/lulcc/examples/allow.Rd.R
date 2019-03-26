library(lulcc)


### Name: allow
### Title: Implement decision rules for land use change
### Aliases: allow

### ** Examples


## Plum Island Ecosystems

## load observed land use data
obs <- ObsLulcRasterStack(x=pie,
                   pattern="lu",
                   categories=c(1,2,3),
                   labels=c("forest","built","other"),
                   t=c(0,6,14))

## get land use values
x <- getValues(obs[[1]])
x <- x[!is.na(x)]

## create vector of arbitrary land use history values
hist <- sample(1:10, length(x), replace=TRUE)

## calculate demand and get change direction for first timestep
dmd <- approxExtrapDemand(obs=obs, tout=0:14)
cd <- dmd[2,] - dmd[1,]
 
## create rules matrix, only allowing forest to change if the cell has
## belonged to forest for more than 8 years
rules <- matrix(data=c(1,1008,1008,
                        1,1,1,
                        1,1,1), nrow=3, ncol=3, byrow=TRUE)

allow <- allow(x=x,
               hist=hist,
               categories=obs@categories,
               cd=cd,
               rules=rules)

## create raster showing cells that are allowed to change from forest to built
r <- obs[[1]]
r[!is.na(r)] <- allow[,2]
r[obs[[1]] != 1] <- NA
plot(r)

## NB output is only useful when used within allocation routine




