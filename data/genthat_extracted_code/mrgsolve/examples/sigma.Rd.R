library(mrgsolve)


### Name: sigma
### Title: Manipulate SIGMA matrices
### Aliases: sigma smat SIGMA smat,missing-method smat,matrix-method
###   smat,list-method smat,sigmalist-method smat,mrgmod-method
###   smat,NULL-method smat,mrgsims-method

### ** Examples

## example("sigma")
mat1 <- matrix(1)
mat2 <- diag(c(1,2))
mat3 <- matrix(c(0.1, 0.002, 0.002, 0.5), 2,2)
mat4 <- dmat(0.1, 0.2, 0.3, 0.4)

smat(mat1)
smat(mat1, mat2, mat3)
smat(A=mat1, B=mat2, C=mat3)

mod <- mrgsolve:::house() %>% smat(mat1)

smat(mod)
smat(mod, make=TRUE)



