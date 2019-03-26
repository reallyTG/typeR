library(rpsychi)


### Name: md.pattern2
### Title: Display missing-data patterns
### Aliases: md.pattern2
### Keywords: array

### ** Examples

##Iwasaki (2002)
dat <- data.frame(matrix(c(
71  ,  68,  72,  72,  90,  72,  77,  76,  84,  77,
1850,2000,2100,1700,  NA,2200,2150,  NA,  NA,  NA,
136 , 139, 147, 142,  NA, 150, 156,  NA, 152,  NA,
34  , 45 ,  50,  38,  NA,  41,  43,  52,  57,  48
), ncol=4))
md.pattern2(dat)


#sample sizes in the specific pattern
#^
#^               numbers of missing data in each pattern
#|                ^
#|                |
#    X2 X3 X4 X1 NA
#6    1  1  1  1  0
#2    0  0  1  1  2
#1    0  0  0  1  3
#1    0  1  1  1  1
#Sum  4  3  1  0  8 --> numbers of missing data in each variable




