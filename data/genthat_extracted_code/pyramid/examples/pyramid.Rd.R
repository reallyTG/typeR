library(pyramid)


### Name: pyramid
### Title: Drawing population pyramid using data.frame
### Aliases: pyramid
### Keywords: hplot

### ** Examples

ages <- c('0-9','10-19','20-29','30-39','40-49','50-59','60-')
males <- c(34,19,11,11,8,7,5)
females <- c(26,25,16,11,7,5,1)
data <- data.frame(males,females,ages)
pyramid(data)
# another example
py.Males <- c(80,40,30,20,10)
names(py.Males) <- c('0-9','10-19','20-29','30-39','40-')
py.Females <- c(60,50,40,30,5)
names(py.Females) <- names(py.Males)
py.df <- data.frame(py.Females,py.Males)
pyramid(py.df,Llab="Females",Rlab="Males",Lcol="navy", Ldens=5, Rcol="red", 
 Rdens=10, GL=FALSE,main="An example of population pyramid\n with auto-axis")
# GunmaPop2005 is included in this package.
pyramid(GunmaPop2005,Llab="Males",Rlab="Females",Clab="",Laxis=seq(0,20000,len=5),
 AxisFM="d", AxisBM=",", Csize=0.8,  Cstep=10, 
 main="Population pyramid of Gunma Prefecture\n (Data: Census 2005, total by gender)")



