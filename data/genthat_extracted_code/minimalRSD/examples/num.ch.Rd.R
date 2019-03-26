library(minimalRSD)


### Name: num.ch
### Title: Number of Changes in Factor Levels of the Design
### Aliases: num.ch

### ** Examples

# For generating a minimally changed CCD with 4 factors
des<-min_ccd(4)
# To count the number of level changes in the generated design
num.ch(des$CCD_design)



