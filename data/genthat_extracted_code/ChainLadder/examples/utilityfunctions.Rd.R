library(ChainLadder)


### Name: Cumulative and incremental triangles
### Title: Cumulative and incremental triangles
### Aliases: incr2cum cum2incr
### Keywords: array

### ** Examples


# See the Taylor/Ashe example in Mack's 1993 paper

#original triangle
GenIns

#incremental triangle
cum2incr(GenIns)

#original triangle
incr2cum(cum2incr(GenIns))

# See the example in Mack's 1999 paper

#original triangle
Mortgage
incMortgage <- cum2incr(Mortgage)
#add missing values
incMortgage[1,1] <- NA
incMortgage[2,1] <- NA
incMortgage[1,2] <- NA

#with missing values argument
incr2cum(incMortgage, na.rm=TRUE)

#compared to 
incr2cum(Mortgage)




