library(Matrix)


### Name: all-methods
### Title: "Matrix" Methods for Functions all() and any()
### Aliases: all-methods all,Matrix-method any,Matrix-method
###   all,ldenseMatrix-method all,lsparseMatrix-method all,lsyMatrix-method
###   any,lMatrix-method
### Keywords: methods

### ** Examples

M <- Matrix(1:12 +0, 3,4)
all(M >= 1) # TRUE
any(M < 0 ) # FALSE
MN <- M; MN[2,3] <- NA; MN
all(MN >= 0) # NA
any(MN <  0) # NA
any(MN <  0, na.rm = TRUE) # -> FALSE
## Don't show: 
sM <- as(MN, "sparseMatrix")
stopifnot(all(M >= 1), !any(M < 0),
          all.equal((sM >= 1), as(MN >= 1, "sparseMatrix")),
          ## MN:
          any(MN < 2), !all(MN < 5),
          is.na(all(MN >= 0)), is.na(any(MN < 0)),
          all(MN >= 0, na.rm=TRUE), !any(MN < 0, na.rm=TRUE),
          ## same for sM :
          any(sM < 2), !all(sM < 5),
          is.na(all(sM >= 0)), is.na(any(sM < 0)),
          all(sM >= 0, na.rm=TRUE), !any(sM < 0, na.rm=TRUE)
         )
## End(Don't show)



