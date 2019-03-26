library(xgobi)


### Name: reggeom
### Title: Geometry of Regression with Two Regressors
### Aliases: reggeom
### Keywords: dynamic

### ** Examples

reggeom()

## The arguments given in this example are modifications of the default,
## some lines dropped, some added, some line colors changed,
## in order to emphasize the geometry of backfitting.
reggeom(
      lines= cbind(c(1,6,8,1,11,7,1,1,6,6,15,17,8,5,9, 5,6,14,15,16,14,15,5),
                   c(6,8,2,11,7,3,4,5,4,15,17,5,5,9,7,11,14,15,16,17,4,4,4)),
      linecolors=c("red", rep("yellow",5), "orchid", "green",
                   "slateblue", rep("skyblue",3), rep("white",3), "skyblue",
                   rep("red",4), rep("slateblue", 2), "green"),
      title="Regression Geometry - Backfitting")



