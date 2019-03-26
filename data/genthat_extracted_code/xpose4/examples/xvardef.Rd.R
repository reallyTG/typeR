library(xpose4)


### Name: xvardef
### Title: Extract and set Xpose variable definitions.
### Aliases: xvardef xvardef<-

### ** Examples

xpdb <- simpraz.xpdb

## get the column name in the Data slot of object xpdb
## corresponding to the label dv
xvardef("dv", xpdb)

## reset the which column the label dv points to in the Data slot of
## object xpdb
xvardef(xpdb) <- c("dv", "DVA")




