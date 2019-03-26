library(hhh4contacts)


### Name: contactmatrix
### Title: POLYMOD Contact Matrices for Germany
### Aliases: contactmatrix contactmatrix_mossong
###   contactmatrix_mossong_physical contactmatrix_POLYMOD
###   contactmatrix_POLYMOD_physical contactmatrix_wallinga
###   contactmatrix_wallinga_physical
### Keywords: datasets

### ** Examples

## contact matrix reported in Mossong et al (2008, Table S5)
(C_original <- contactmatrix(which = "mossong", grouping = NULL))
## this simply returns the dataset 'contactmatrix_mossong'
stopifnot(identical(C_original, contactmatrix_mossong))

## with corrected numbers for the 70+ age group (the default)
C_corrected <- contactmatrix(which = "corrected", grouping = NULL)
## this simply returns the dataset 'contactmatrix_POLYMOD'
stopifnot(identical(C_corrected, contactmatrix_POLYMOD))

## check for differences
C_original == round(C_corrected, 2)
## compare entries of last row and last column
round(rbind(original = C_original[15,], corrected = C_corrected[15,]), 2)
round(cbind(original = C_original[,15], corrected = C_corrected[,15]), 2)

## contact matrix estimated to be reciprocal on the population level
C_reciprocal <- contactmatrix(which = "reciprocal", grouping = NULL)
## this simply returns the dataset 'contactmatrix_wallinga'
## (without its "overdisp" attribute)
stopifnot(all.equal(C_reciprocal, contactmatrix_wallinga, check.attributes=FALSE))

## check reciprocity
agedistriBE <- attr(C_reciprocal, "agedistri")
stopifnot(identical(agedistriBE, prop.table(colSums(pop2011))))
stopifnot(isSymmetric(C_reciprocal * agedistriBE, check.attributes=FALSE))

## visually compare raw to reciprocal contact matrix
if (require("gridExtra"))
    grid.arrange(plotC(C_corrected, main = "raw"),
                 plotC(C_reciprocal, main = "reciprocal"),
                 nrow = 1)

## select physical contacts and aggregate into 5 age groups
contactmatrix(type = "physical", grouping = c(1, 2, 7, 3, 2))

## the default 6 age groups, normalized to a transition matrix
contactmatrix(normalize = TRUE)

## reciprocity also holds for this grouping
(C6 <- contactmatrix(which = "reciprocal"))
stopifnot(isSymmetric(C6 * attr(C6, "agedistri"), check.attributes=FALSE))




