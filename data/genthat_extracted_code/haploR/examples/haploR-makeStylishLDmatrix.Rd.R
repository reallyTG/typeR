library(haploR)


### Name: makeStylishLDmatrix
### Title: This function queries HaploReg web-based tool and returns
###   results.
### Aliases: makeStylishLDmatrix

### ** Examples

library(haploR)
data <- LDlink.LDmatrix(c("rs10048158","rs4791078"))
head(data)
makeStylishLDmatrix(data$matrix.r2)



