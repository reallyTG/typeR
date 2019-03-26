library(diaplt)


### Name: beadsplot
### Title: Beads Summary Plot
### Aliases: beadsplot beadsplot.default beadsplot.data.frame
###   beadsplot.numeric beadsplot.character beadsplot.formula
### Keywords: hplot

### ** Examples

# iris data, by Species
beadsplot(Species~., iris)
beadsplot('Species', iris)
beadsplot(iris[1:4], iris[5])
beadsplot(iris[1:4], iris[,5])

# iris data, Petal.Length by Species
beadsplot(iris[,'Petal.Length'], iris[,'Species'], drift.label.factor=-0.2)

# horizontal
beadsplot(Species~., iris, horizontal=TRUE)

# color, sheer and shading
beadsplot(Species~., iris, 
          col=c('tomato1','tomato4','tomato3'), sheer=c(1,0.3,0.6,0.05))
beadsplot(Species~., iris, bw=0.5, label.factor=FALSE,
          sheer=c(1,0.9,0.6,0.4), lwd=NULL)
beadsplot(Species~., iris, shading=c(3,5))

# labels
beadsplot(Species~., iris, label.factor=FALSE)
beadsplot(Species~., iris, label.factor=c('a','b','c'), 
          drift.label.factor=0.05)
beadsplot(Species~., iris, legend=FALSE)

# scale grids
## disable grids
beadsplot(Species~., iris, scale.grid.center=FALSE, scale.grid.border=FALSE)
## color grids
beadsplot(Species~., iris, scale.grid.center='red', scale.grid.border='tan')

# scaling
beadsplot(Species~., iris, scale.range=50, scale.mean=50)
## no centering by mean
beadsplot(Species~., iris, scale.mean=NULL)
## plot raw values
beadsplot(Species~., iris, scale.range=NULL, scale.mean=NULL)
beadsplot(Species~., iris, scale.range=NULL, scale.mean=NULL, scale.log=TRUE)
## custom value scaling

### critical matrix as ranges of versicolor,
###   in sequeence of Sep.Len, Sep.Wid, Pet.Len, Pet.Wid
criticals <- matrix(c(4.9,7.0, 2.0,3.4, 3.0,5.1, 1.0,1.8), nrow=2, ncol=4)
beadsplot(Species~., iris, scale.data.border=criticals)

### recommend vector as mean of versicolor, in sequeence of 
###            S.Len, S.Wid, P.Len, P.Wid
recommend <- c(5.936, 2.770, 4.260, 1.326)
beadsplot(Species~., iris, scale.data.border=criticals, scale.data.center=recommend)
### when both of center and border is specified,
### center is dominance, border is adjusted to indicate  
### the width between lower and upper grids. 
### in this case, criticals can be simplified as follows,
### criticals <- matrix(c(0,2.1, 0,1.4, 0,2.1, 0,0.8), nrow=2, ncol=4)
### because differences each are used. 

### recommend vector as mean of setosa, in sequeence of 
###             S.Len, S.Wid, P.Len, P.Wid
recommend2 <- c(5.006, 3.428, 1.462, 0.246)
beadsplot(Species~., iris, scale.data.border=criticals, scale.data.center=recommend2)
### center grid is on setosa mean, 
### lower and upper grids indicate versicolor range width.

beadsplot(Species~., iris, scale.data.center=recommend2)
### center grid is on setosa mean, 
### lower and upper grids indicate whole range width.

# using median and IQR
q1 <- function(x) fivenum(x)[2]
q3 <- function(x) fivenum(x)[4]
q2 <- median
beadsplot(Species~., iris, S=q1, E=q2, N=q3)

# graphic parameters
beadsplot(Species~., iris, cex=0.7, cex.axis=0.7)

# print summary
beadsplot(Species~., iris, plot=FALSE)



