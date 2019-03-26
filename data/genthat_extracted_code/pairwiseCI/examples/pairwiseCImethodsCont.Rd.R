library(pairwiseCI)


### Name: pairwiseCImethodsCont
### Title: Confidence intervals for two sample comparisons of continuous
###   data
### Aliases: pairwiseCImethodsCont Param.diff Param.ratio Lognorm.diff
###   Lognorm.ratio Median.diff Median.ratio HL.diff HL.ratio HD.diff
###   HD.ratio
### Keywords: htest

### ** Examples



data(sodium)

iso<-subset(sodium, Treatment=="xisogenic")$Sodiumcontent
trans<-subset(sodium, Treatment=="transgenic")$Sodiumcontent

iso
trans

## CI for the difference of means, 
# assuming normal errors and homogeneous variances :

thomo<-Param.diff(x=iso, y=trans, var.equal=TRUE)

# allowing heterogeneous variances
thetero<-Param.diff(x=iso, y=trans, var.equal=FALSE)


## Fieller CIs for the ratio of means,
# also assuming normal errors:

Fielhomo<-Param.ratio(x=iso, y=trans, var.equal=TRUE)

# allowing heterogeneous variances

Fielhetero<-Param.ratio(x=iso, y=trans, var.equal=FALSE)


HLD<-HL.diff(x=iso, y=trans)

thomo
thetero

Fielhomo
Fielhetero

HLD


# # #

# Lognormal CIs:

x<-rlnorm(n=10, meanlog=0, sdlog=1)
y<-rlnorm(n=10, meanlog=0, sdlog=1)

Lognorm.diff(x=x, y=y)
Lognorm.ratio(x=x, y=y)

 


