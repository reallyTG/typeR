library(demogR)


### Name: life.table
### Title: life.table
### Aliases: life.table
### Keywords: array

### ** Examples

data(goodman)
## default type="kf"
vlt <- with(goodman, life.table(x=age, nKx=ven.nKx, nDx=ven.nDx))

## compare nax values for cd vs kf life tables
vlt1 <- with(goodman, life.table(x=age, nKx=ven.nKx, nDx=ven.nDx, type="cd"))
vlt$nax[1:2]
vlt1$nax[1:2]

## now construct a cohort life table for Himalayan thar,
##  (Hemitargus jemlahicus) 
data(thar)
thar.lt <- with(thar, life.table(x=age, nDx=deaths, nKx=count, 
    type="cohort", iwidth=1, width12=c(1,1)))
thar.lt



