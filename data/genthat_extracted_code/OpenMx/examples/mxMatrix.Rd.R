library(OpenMx)


### Name: mxMatrix
### Title: Create MxMatrix Object
### Aliases: mxMatrix

### ** Examples

# Create a 3 x 3 identity matrix

idenMatrix <- mxMatrix(type = "Iden", nrow = 3, 
    ncol = 3, name = "I")

# Create a full 4 x 2 matrix from existing 
# value matrix with all free parameters

vals <- matrix(1:8, nrow = 4)
fullMatrix <- mxMatrix(type = "Full", values = vals, 
    free = TRUE, name = "foo")
 
# Create a 3 x 3 symmetric matrix with free off-
# diagonal parameters and starting values

symmMatrix <- mxMatrix(type = "Symm", nrow = 3, ncol = 3,
    free = c(FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
    values = c(1, .8, .8, 1, .8, 1),
    labels = c(NA, "free1", "free2", NA, "free3", NA),
    name = "bar")

# Create an mxMatrix from a character matrix.  All numbers are
# interpreted as fixed and non-numbers are interpreted as free
# parameters.

matrixFromChar <- function(inputm, name=NA) {
  inputmFixed <- suppressWarnings(matrix(
    as.numeric(inputm),nrow = nrow(inputm), ncol = ncol(inputm)))
  inputmCharacter <- inputm
  inputmCharacter[!is.na(inputmFixed)] <- NA
  mxMatrix(nrow=nrow(inputm), ncol=ncol(inputm),
           free=!is.na(inputmCharacter),
           values=inputmFixed,
           labels=inputmCharacter,
           dimnames=dimnames(inputm), name=name)
}


# Demonstrate some of the behavior of the condensed slots
# Create a 3x3 matrix with condensed slots

a <- mxMatrix('Full', 3, 3, values=1, condenseSlots=TRUE)
a@free # at operator returns the stored 1x1 matrix
a$free # dollar operator constructs full matrix for printing

# assignment with the dollar operator
#  de-condenses the slots to create the
#  full 3x3 matrix
a$free[1,1] <- TRUE
a@free






