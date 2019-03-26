library(Ecfun)


### Name: UShouse.senate
### Title: Create a list of members of the US House and Senate
### Aliases: UShouse.senate
### Keywords: datasets IO

### ** Examples

if(!fda::CRAN()){
house <- readUShouse()

USreps <- UShouse.senate(house)
}



