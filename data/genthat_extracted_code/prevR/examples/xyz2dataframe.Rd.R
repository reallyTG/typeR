library(prevR)


### Name: xyz2dataframe
### Title: Convert a surface in xyz to a data frame.
### Aliases: xyz2dataframe
### Keywords: manip spatial

### ** Examples

  x <- c(2,4,6,8,10)
  y <- x 
  op <- GenKern::KernSur(x,y, xgridsize=50, ygridsize=50,
                correlation=0, 
                xbandwidth=1, ybandwidth=1,
                range.x=c(0,13), range.y=c(0,13)
  )
  str(op)
  
  op.df <- xyz2dataframe(op)
  str(op.df)




