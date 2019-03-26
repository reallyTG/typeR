library(cellranger)


### Name: as.ra_ref
### Title: Convert to a ra_ref object
### Aliases: as.ra_ref as.ra_ref.cell_addr as.ra_ref.character as.ra_ref_v
###   as.ra_ref_v.cell_addr as.ra_ref_v.character

### ** Examples

## as.ra_ref.character()
as.ra_ref("$F$2")
as.ra_ref("R[-4]C3")
as.ra_ref("B4")
as.ra_ref("B4", strict = FALSE)
as.ra_ref("B$4")

## this is actually ambiguous! is format A1 or R1C1 format?
as.ra_ref("RC2")
## format could be specified in this case
as.ra_ref("RC2", fo = "R1C1")
as.ra_ref("RC2", fo = "A1", strict = FALSE)

## as.ra_ref_v.character()
cs <- c("$A$1", "Sheet1!$F$14", "Sheet2!B$4", "D9")
## Not run: 
##D ## won't work because as.ra_ref requires length one input
##D as.ra_ref(cs)
## End(Not run)
## use as.ra_ref_v instead
as.ra_ref_v(cs, strict = FALSE)
## as.ra_ref.cell_addr
ca <- cell_addr(2, 5)
as.ra_ref(ca)
## as.ra_ref_v.cell_addr()

ca <- cell_addr(1:3, 1)
## Not run: 
##D ## won't work because as.ra_ref methods not natively vectorized
##D as.ra_ref(ca)
## End(Not run)
## use as.ra_ref_v instead
as.ra_ref_v(ca)



