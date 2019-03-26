library(vegtable)


### Name: df2vegtable
### Title: Convert a data frame into a vegtable object.
### Aliases: df2vegtable df2vegtable,data.frame,numeric,numeric-method
###   df2vegtable,data.frame,numeric,missing-method
### Keywords: methods

### ** Examples

## Creating data set 'dune_veg'
library(vegtable)
library(vegan)

## Load data from vegan
data(dune)
data(dune.env)

## Conversion to vegtable
dune_veg <- data.frame(species=colnames(dune), t(dune), stringsAsFactors=FALSE,
        check.names=FALSE)
dune_veg <- df2vegtable(dune_veg, species=1)

summary(dune_veg)

## Adding environmental variables
dune.env$ReleveID <- as.integer(rownames(dune.env))
header(dune_veg) <- dune.env

summary(dune_veg)



