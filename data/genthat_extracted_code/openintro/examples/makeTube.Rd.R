library(openintro)


### Name: makeTube
### Title: Regression tube
### Aliases: makeTube
### Keywords: Regression Kernel smoothing Data tube Least squares

### ** Examples

#===> possum example <===#
data(possum)
x <- possum$totalL
y <- possum$headL
plot(x,y)
makeTube(x,y,1)
makeTube(x,y,2)
makeTube(x,y,3)

#===> Grades and TV example <===#
data(gradesTV)
par(mfrow=c(2,2))
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5)
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, stDev='o')
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, type='robust')
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, type='robust', stDev='o')

#===> What can go wrong with a basic least squares model <===#
par(mfrow=c(1,3), mar=c(2.5, 2.5, 1, 2.5))
# 1
x <- runif(100)
y <- 25*x-20*x^2+rnorm(length(x), sd=1.5)
plot(x,y)
makeTube(x,y,type='q')
# 2
x <- c(-0.6, -0.46, -0.091, runif(97))
y <- 25*x + rnorm(length(x))
y[2] <- y[2] + 8
y[1] <- y[1] + 1
plot(x,y,ylim=range(y)+c(-10,5))
makeTube(x,y)
# 3
x <- runif(100)
y <- 5*x + rnorm(length(x), sd=x)
plot(x,y)
makeTube(x, y, stDev='l', bw=0.03)



