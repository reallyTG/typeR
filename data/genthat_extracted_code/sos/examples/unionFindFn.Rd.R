library(sos)


### Name: unionFindFn
### Title: Combine findFn Objects
### Aliases: unionFindFn intersectFindFn Ops.findFn
### Keywords: misc

### ** Examples

des1 <- findFn('differential equations', 1)
de1 <- findFn('differential equation', 1)
# each retrieves 1 page of 20 hits
# but not the same 20

de.s <- unionFindFn(des1, de1)
# combines the two, eliminating duplicates.

# or the sorter version:
de.s. <- des1 | de1
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(de.s, de.s.)
## Don't show: 
)
## End(Don't show)

## Don't show: 
# union with no data
de0 <- unionFindFn(des1[numeric(0), ], de1[numeric(0), ])
## End(Don't show)

# Keep only the common entries.
de2 <- intersectFindFn(des1, de1)
de2. <- des1 & de1
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(de2, de2.)
## Don't show: 
)
## End(Don't show)

# summary and print still work with the combined object.
summary(de.s)
if(!fda::CRAN()){
  de.s
}

summary(de2)
if(!fda::CRAN()){
  de2
}

## Don't show: 
# The following gave an error;  now fixed 2009.05.12
x <- findFn("spline", maxPages = 1, quiet = TRUE)
y <- findFn("winbugs", maxPages = 1, quiet = TRUE)
xy <- intersectFindFn( x, y )
## End(Don't show)




