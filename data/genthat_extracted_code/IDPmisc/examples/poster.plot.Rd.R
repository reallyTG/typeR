library(IDPmisc)


### Name: poster.plot
### Title: Convenient xyplot with Differently Colored Margin and Plot
###   Region
### Aliases: poster.plot
### Keywords: hplot

### ** Examples

poster.plot(iris[,1],iris[,2],
            xlab="Sepal.Length", ylab="Sepal.Width")

poster.plot(iris[,1], col="red", col.box="grey95", ylab="Sepal.Length")

## plotting lines
n <- 200
freq <- 1:n
y <- sin(freq/n*4*pi)*cos(freq/n*3*pi) + 0.1*rnorm(n)
poster.plot(y,col.fg="grey30",type="l")



