library(plotrix)


### Name: tab.title
### Title: Display the title of a plot as a colored tab
### Aliases: tab.title
### Keywords: misc

### ** Examples

 testx<-matrix(cumsum(rnorm(30)^2)+1,nrow=10)
 stackpoly(testx,main="",
  xaxlab=c("One","Two","Three","Four","Five",
  "Six","Seven","Eight","Nine","Ten"),staxx=TRUE)
 tab.title("Three Squiggly Lines",tab.col="yellow",radius=0.5)



