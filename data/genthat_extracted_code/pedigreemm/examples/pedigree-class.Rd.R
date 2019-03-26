library(pedigreemm)


### Name: pedigree-class
### Title: Class "pedigree"
### Aliases: pedigree-class pedinbred-class
###   coerce,pedigree,sparseMatrix-method coerce,pedigree,data.frame-method
###   head,pedigree-method show,pedigree-method tail,pedigree-method
### Keywords: classes

### ** Examples

## Rather use, pedigree()!   The following is "raw code":
## Example from chapter 2 of Mrode (2005)
p1 <- new("pedigree",
          sire = as.integer(c(NA,NA,1, 1,4,5)),
          dam  = as.integer(c(NA,NA,2,NA,3,2)),
          label = as.character(1:6))
p1
(dtc <- as(p1, "sparseMatrix"))   # T-inverse in Mrode's notation
solve(dtc)
inbreeding(p1)



