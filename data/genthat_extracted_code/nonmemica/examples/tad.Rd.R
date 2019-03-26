library(nonmemica)


### Name: tad
### Title: Calculate Time Since Most Recent Dose
### Aliases: tad

### ** Examples

data(tad1)
x <- tad1
head(x)
x$tad <- tad(
   x = x$TIME,
   dose = x$EVID %in% c(1,4) & is.na(x$C),
   addl = x$ADDL,
   ii = x$II,
   index = x$ID
 )
head(x)



