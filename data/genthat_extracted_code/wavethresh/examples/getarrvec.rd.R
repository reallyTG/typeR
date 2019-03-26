library(wavethresh)


### Name: getarrvec
### Title: Compute and return weaving permutation for conversion from wst
###   objects to wd class objects.
### Aliases: getarrvec
### Keywords: array

### ** Examples

#
# What would the permutation be for a wst
# object with 4 levels?
#
arrvec <- getarrvec(4)
#arrvec
#      [,1] [,2] [,3] 
# [1,]    1    1    1
# [2,]    9    9    9
# [3,]    2    5    5
# [4,]   10   13   13
# [5,]    3    2    3
# [6,]   11   10   11
# [7,]    4    6    7
# [8,]   12   14   15
# [9,]    5    3    2
#[10,]   13   11   10
#[11,]    6    7    6
#[12,]   14   15   14
#[13,]    7    4    4
#[14,]   15   12   12
#[15,]    8    8    8
#[16,]   16   16   16
#
# The permutation for level 3 is in column 1
# The permutation for level 2 is in column 2
# The permutation for level 1 is in column 3.
#
# The following shows that the above is the right permutation (for level 2
# at least.
#
# Start off with some random normal data!
#
myrand <- rnorm(1:16)
#
# Now take both the time ordered non-decimated wavelet
# transform and the packet ordered non-decimated wavelet
# transform.
#
myrwdS <- wd(myrand, type="station")
myrwst <- wst(myrand)
#
# Let's look at the level 2 coefficients of myrwdS
#
accessD(myrwdS, level=2)
# [1] -0.73280829 -0.97892279  1.33305777  1.46320165 -0.94790098
# [6] -1.39276215  0.40023757  0.82517249 -0.56317955 -0.89408713
#[11]  0.77166463  1.56204870 -0.34342230 -1.64133182  0.08235115
#[16]  1.05668106
#
# Let's look at the level 2 coefficients of myrwst
#
accessD(myrwst, level=2)
# [1] -0.73280829 -0.94790098 -0.56317955 -0.34342230  1.33305777
# [6]  0.40023757  0.77166463  0.08235115 -0.97892279 -1.39276215
#[11] -0.89408713 -1.64133182  1.46320165  0.82517249  1.56204870
#[16]  1.05668106
#
# O.k. So the coefficients are the same, but they are not in the
# same order as in myrwdS. So let's use the permutation in the
# second column of arrvec to reorder the myrwst coefficients
# to have the same order as the myrwdS ones
#
accessD(myrwst, level=2)[arrvec[,2]]
# [1] -0.73280829 -0.97892279  1.33305777  1.46320165 -0.94790098
# [6] -1.39276215  0.40023757  0.82517249 -0.56317955 -0.89408713
#[11]  0.77166463  1.56204870 -0.34342230 -1.64133182  0.08235115
#[16]  1.05668106
#
# These coefficients have the correct ordering.



