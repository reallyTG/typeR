library(plotrix)


### Name: violin_plot
### Title: Display a "violin" plot
### Aliases: violin_plot
### Keywords: misc

### ** Examples

 # plotting a data frame
 violin_plot(mtcars)

 set.seed(42)
 normvar<-c(rnorm(49),-3)
 unifvar<-runif(50,-2,2)
 normvar2<-rnorm(45)

 # plotting a matrix
 violin_plot(matrix(c(normvar,unifvar),ncol=2),
  main="Default Plot",x_axis_labels=c("Normal","Uniform"))

 # plotting with different colors and with at specified
 violin_plot(matrix(c(normvar,unifvar),ncol=2),at=1:3,
  main="Different colors and extra space",
  x_axis_labels=c("Normal","Uniform","Normal"),
  show_outliers=TRUE,col=c("blue","red"),median_col="lightgray",
  pch=6)

 # adding a violin to existing plot
 violin_plot(normvar2,at=3,add=TRUE,col="green",violin_width=1)



