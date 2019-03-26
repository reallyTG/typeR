library(shapes)


### Name: resampletest
### Title: Tests for mean shape difference using complex arithmetic,
###   including bootstrap and permutation tests.
### Aliases: resampletest
### Keywords: multivariate

### ** Examples


#2D example : female and male Gorillas

data(gorf.dat)
data(gorm.dat)

#just select 3 landmarks and the first 10 observations in each group
select<-c(1,2,3)
A<-gorf.dat[select,,1:10]
B<-gorm.dat[select,,1:10]
resampletest(A,B,resamples=100)




