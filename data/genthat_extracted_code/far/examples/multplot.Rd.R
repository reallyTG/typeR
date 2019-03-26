library(far)


### Name: multplot
### Title: Multivariate plots
### Aliases: multplot multplot.default multplot.fdata
### Keywords: hplot

### ** Examples

  # Simulation of a FARX process
  data1 <- simul.farx(m=10,n=100,base=base.simul.far(20,5),
                base.exo=base.simul.far(20,5),
                d.a=matrix(c(0.5,0),nrow=1,ncol=2),
                alpha.conj=matrix(c(0.2,0),nrow=1,ncol=2),
                d.rho=diag(c(0.45,0.90,0.34,0.45)),
                alpha=diag(c(0.5,0.23,0.018)),
                d.rho.exo=diag(c(0.45,0.90,0.34,0.45)),
                cst1=0.0)

 # 2 variables : X et Z
 # number of points per curve : 10
 # number of curves : 100
 # corresponding dates
 date.fdata(data1)

 multplot(data1) # plot the date "1" of the variables "X" and "Z"
 multplot(data1,legend=TRUE) # Same thing with a legend
 multplot(data1,legend=TRUE,yleg=-0.5) # same thing with a legend misplaced
 multplot(data1,main="day 1",legend=TRUE,xlab="hour",
          ylab="object of study")

 par(mfrow=c(1,3))
 multplot(data1,date=c("3","4","5")) # days "3", "4" and "5" are plotted
 par(mfrow=c(1,1))

 # to plot the whole series, we used whole = TRUE
 # but we have to give the x values

 multplot(data1,xval=seq(from=0,to=99.9,by=0.1),whole=TRUE)

 # to plot a subset of the series,
 # it is recommended to create a subset object with select.fdata
 data2 <- select.fdata(data1,date=c("4","5","6"))
 multplot(data2,xval=seq(from=4,to=6.9,by=0.1),whole=TRUE)



