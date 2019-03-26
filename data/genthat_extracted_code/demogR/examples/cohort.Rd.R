library(demogR)


### Name: cohort
### Title: cohort
### Aliases: cohort
### Keywords: array

### ** Examples

data(thar)
thar.lt <- with(thar, life.table(x=age, nDx=deaths, nKx=count, 
    type="cohort", iwidth=1, width12=c(1,1)))
thar.lt



