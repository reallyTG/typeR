library(ASMap)


### Name: mstmap.cross
### Title: Extremely fast linkage map construction for 'qtl' objects using
###   MSTmap.
### Aliases: mstmap.cross mstmap
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## bulking linkage groups and reconstructing entire linkage map

test1 <- mstmap(mapDH, bychr = FALSE, dist.fun = "kosambi",
                trace = FALSE)
pull.map(test1)

## one linkage group at a time (possibly break established linkage
## groups)

test2 <- mstmap(mapDH, bychr = TRUE, dist.fun = "kosambi", trace = FALSE)
pull.map(test2)

## one linkage group at a time (do not break established linkage groups)

test3 <- mstmap(mapDH, bychr = TRUE, dist.fun = "kosambi", p.value = 2,
                trace = FALSE)
pull.map(test3)

## impute before clustering and detect genotyping errors, pipe output to
## file

test4 <- mstmap(mapDH, bychr = FALSE, dist.fun = "kosambi",
                trace = TRUE, mvest.bc = TRUE, detectBadData = TRUE)
pull.map(test4)




