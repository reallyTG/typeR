library(RFOC)


### Name: FOCangles
### Title: Angles for focal planes
### Aliases: FOCangles
### Keywords: misc

### ** Examples



mo = list(n=1, m1=1.035675e+017, m2=-1.985852e+016,
  m3=-6.198052e+014, m4=1.177936e+017,
  m5=-7.600627e+016, m6=-3.461405e+017)


moments = cbind(mo$n, mo$m1, mo$m2, mo$m3, mo$m4, mo$m5, mo$m6)

 di = dim(moments)
    number.of.events = di[1]
moment_11 = moments[,2]
moment_22 = moments[,3]
moment_33 = moments[,4]
moment_23 = moments[,5]
moment_13 = moments[,6]
moment_12 = moments[,7]


i = 1
m=matrix( c(moment_11[i],moment_12[i],moment_13[i],
       moment_12[i],moment_22[i],moment_23[i],
       moment_13[i],moment_23[i],moment_33[i]), ncol=3, byrow=TRUE)

   angles.all = FOCangles(m)
print(angles.all)







