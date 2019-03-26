library(semTools)


### Name: parcelAllocation
### Title: Random Allocation of Items to Parcels in a Structural Equation
###   Model
### Aliases: parcelAllocation

### ** Examples


## Fit 2-factor CFA to simulated data. Each factor has 9 indicators.

## Specify the item-level model (if NO parcels were created)
item.syntax <- c(paste0("f1 =~ f1item", 1:9),
                 paste0("f2 =~ f2item", 1:9))
cat(item.syntax, sep = "\n")
## Below, we reduce the size of this same model by
## applying different parceling schemes


## 3-indicator parcels
mod.parcels <- '
f1 =~ par1 + par2 + par3
f2 =~ par4 + par5 + par6
'
## names of parcels
(parcel.names <- paste0("par", 1:6))

## Not run: 
##D parcelAllocation(mod.parcels, data = simParcel, parcel.names, item.syntax,
##D                  nAlloc = 20, std.lv = TRUE, parallel = "snow", iseed = 12345)
## End(Not run)


## multigroup example
simParcel$group <- 0:1 # arbitrary groups for example
mod.mg <- '
f1 =~ par1 + c(L2, L2)*par2 + par3
f2 =~ par4 + par5 + par6
'
## names of parcels
(parcel.names <- paste0("par", 1:6))

set.seed(12345)
parcelAllocation(mod.mg, data = simParcel, parcel.names, item.syntax,
                 std.lv = TRUE, group = "group", group.equal = "loadings",
                 nAlloc = 20, show.progress = TRUE)



## parcels for first factor, items for second factor
mod.items <- '
f1 =~ par1 + par2 + par3
f2 =~ f2item2 + f2item7 + f2item8
'
## names of parcels
(parcel.names <- paste0("par", 1:3))

set.seed(12345)
parcelAllocation(mod.items, data = simParcel, parcel.names, item.syntax,
                 nAlloc = 20, std.lv = TRUE)



## mixture of 1- and 3-indicator parcels for second factor
mod.mix <- '
f1 =~ par1 + par2 + par3
f2 =~ f2item2 + f2item7 + f2item8 + par4 + par5 + par6
'
## names of parcels
(parcel.names <- paste0("par", 1:6))

set.seed(12345)
parcelAllocation(mod.mix, data = simParcel, parcel.names, item.syntax,
                 nAlloc = 20, std.lv = TRUE)




