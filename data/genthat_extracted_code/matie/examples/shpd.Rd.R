library(matie)


### Name: shpd
### Title: Generates sample hyperplane data.
### Aliases: shpd
### Keywords: coefficient of determination

### ** Examples

    d <- shpd(500,3,Rsq=0.8,Ri=0.01)
    ma(d)$A
    ma(d,partition=list(1,2))$A
    ma(d,partition=list(3,1))$A
    ma(d,partition=list(3,2))$A
    ma(d,partition=list(3,c(1,2)))$A
    cor(d)^2
    # if m=3 and if you have rgl 
    # you can view the data set in 3D 
    # library("rgl")  
    # plot3d(d)



