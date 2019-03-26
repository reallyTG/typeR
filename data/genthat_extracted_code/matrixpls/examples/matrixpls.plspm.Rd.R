library(matrixpls)


### Name: matrixpls.plspm
### Title: A plspm compatibility wrapper for matrixpls
### Aliases: matrixpls.plspm

### ** Examples

if(!require(plspm)){
    print("This example requires the plspm package")
} else{
cores <- getOption("mc.cores")
options(mc.cores=2)

# Run the example from plspm package

# load dataset satisfaction
data(satisfaction)
# inner model matrix
IMAG = c(0,0,0,0,0,0)
EXPE = c(1,0,0,0,0,0)
QUAL = c(0,1,0,0,0,0)
VAL = c(0,1,1,0,0,0)
SAT = c(1,1,1,1,0,0)
LOY = c(1,0,0,0,1,0)
sat_inner = rbind(IMAG, EXPE, QUAL, VAL, SAT, LOY)
# outer model list
sat_outer = list(1:5, 6:10, 11:15, 16:19, 20:23, 24:27)
# vector of modes (reflective indicators)
sat_mod = rep("A", 6)

# apply plspm
plspm.res <- plspm(satisfaction, sat_inner, sat_outer, sat_mod,
                   scaled=FALSE, boot.val=FALSE)

# apply matrixpls
matrixpls.res <- matrixpls.plspm(satisfaction, sat_inner, sat_outer, sat_mod,
                                 scaled=FALSE, boot.val=FALSE)

# If RUnit is installed check that the results are identical

if(is.element("RUnit", installed.packages()[,1])){
  library(RUnit)
  checkEquals(plspm.res, matrixpls.res, tol = 0.001)
}

# print the resuls

print(summary(plspm.res))
print(summary(matrixpls.res))

options(mc.cores=cores)

}



