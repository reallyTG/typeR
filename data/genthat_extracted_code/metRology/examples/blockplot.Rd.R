library(metRology)


### Name: blockplot
### Title: Generate a "block plot" - a histogram variant identifiying
###   individual data points.
### Aliases: blockplot.default blockplot.formula blockplot bplot nclass.23
### Keywords: hplot

### ** Examples


#A simple blockplot
set.seed(55)
x<-rnorm(48, 15)
blockplot(x)

#Aspect ratio control for square blocks
blockplot(x, square=TRUE)

# Specifying groups 
grp <- gl(3, 16)
blockplot(x, groups=grp)

#Formula interface
blockplot(x~grp)

#Vectorised colour specification
blockplot(x~grp, square=TRUE, fill=ifelse(1:48 %in% c(15, 23, 24), "gold", "white") )

#Group labelling
blockplot(x~grp, square=TRUE, grp.labs=paste("Level", 1:3), grp.pos=2)

#A missing group
xm <- x
xm[ grp == "2" ] <- NA
blockplot(xm~grp, square=TRUE, grp.labs=paste("Level", 1:3), grp.pos=2)

blockplot(xm~grp, square=TRUE, grp.labs=paste("Level", 1:3), grp.pos=2, drop.unused=FALSE)




