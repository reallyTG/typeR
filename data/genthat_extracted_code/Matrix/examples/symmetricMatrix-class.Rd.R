library(Matrix)


### Name: symmetricMatrix-class
### Title: Virtual Class of Symmetric Matrices in Package Matrix
### Aliases: symmetricMatrix-class coerce,matrix,symmetricMatrix-method
###   coerce,denseMatrix,symmetricMatrix-method
###   coerce,CsparseMatrix,symmetricMatrix-method
###   dimnames,symmetricMatrix-method
### Keywords: classes

### ** Examples

## An example about the symmetric Dimnames:
sy <- sparseMatrix(i= c(2,4,3:5), j= c(4,7:5,5), x = 1:5, dims = c(7,7),
                   symmetric=TRUE, dimnames = list(NULL, letters[1:7]))
sy # shows symmetrical dimnames
sy@Dimnames  # internally only one part is stored
dimnames(sy) # both parts - as sy *is* symmetrical
## Don't show: 
local({ nm <- letters[1:7]
  stopifnot(identical(dimnames(sy), list(  nm, nm)),
	    identical(sy@Dimnames , list(NULL, nm)))
})
## End(Don't show)
showClass("symmetricMatrix")

## The names of direct subclasses:
scl <- getClass("symmetricMatrix")@subclasses
directly <- sapply(lapply(scl, slot, "by"), length) == 0
names(scl)[directly]

## Methods -- applicaple to all subclasses above:
showMethods(classes = "symmetricMatrix")



