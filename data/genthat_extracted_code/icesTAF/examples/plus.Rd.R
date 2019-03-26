library(icesTAF)


### Name: plus
### Title: Rename Plus Group Column
### Aliases: plus

### ** Examples

catage <- catage.taf

# Rename last column
catage <- plus(catage)

# Shorter and less error-prone than
names(catage)[names(catage)=="4"] <- "4+"




