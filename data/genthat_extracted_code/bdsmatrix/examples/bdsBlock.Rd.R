library(bdsmatrix)


### Name: bdsBlock
### Title: Block diagonal matrices.
### Aliases: bdsBlock
### Keywords: array

### ** Examples

id    <- letters[1:10]
group <- c(1,1,3,2,3,3,2,3,2,4)
bdsBlock(id, group)
## Not run: 
##D     a b d g i c e f h j 
##D   a 1 1 0 0 0 0 0 0 0 0
##D   b 1 1 0 0 0 0 0 0 0 0
##D   d 0 0 1 1 1 0 0 0 0 0
##D   g 0 0 1 1 1 0 0 0 0 0
##D   i 0 0 1 1 1 0 0 0 0 0
##D   c 0 0 0 0 0 1 1 1 1 0
##D   e 0 0 0 0 0 1 1 1 1 0
##D   f 0 0 0 0 0 1 1 1 1 0
##D   h 0 0 0 0 0 1 1 1 1 0
##D   j 0 0 0 0 0 0 0 0 0 1
##D 
##D # Create the matrices for a sparse nested fit of family within city
##D group <- paste(mydata$city, mydata$family, sep='/')
##D mat1 <- bdsI(group)
##D mat2 <- bdsBlock(group, mydata$city)
##D 
##D fit <- coxme(Surv(time, status) ~ age + sex + (1|group), data=mydata,
##D                varlist=list(mat1, mat2))
## End(Not run)


