library(dynRB)


### Name: dynRB_VPa
### Title: Size and pairwise overlap
### Aliases: dynRB_VPa
### Keywords: ~kwd1 ~kwd2

### ** Examples

# example function dynRB_VPa
# for reliable results use steps = 201
data(finch2)
r<-dynRB_VPa(finch2, steps = 101, correlogram = TRUE, row_col = c(1,1))
r$result



