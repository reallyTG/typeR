library(metRology)


### Name: bkp
### Title: Draw block plots from block plot objects
### Aliases: bkp
### Keywords: ~kwd1 hplot

### ** Examples


#A simple blockplot
set.seed(55)
x<-rnorm(48, 15)
b <- blockplot(x)

#Aspect ratio control for square blocks
bkp(b, square=TRUE)

# Specifying groups 
grp <- gl(3, 16)
bg <- blockplot(x~grp)

# Add vertical axes ( axes=TRUE asks for horizontal and vertical axes)
bkp(bg, axes=TRUE ) 

#Axes both left and right
par(mar=c(5,4,4,4)+0.1)
bkp(bg, axes=c(TRUE, TRUE, FALSE, TRUE) ) 
		#Note that axes[3] is FALSE to suppress top axis
		
# Vectorised colour specification
bkp(bg, square=TRUE, fill=ifelse(1:48 %in% c(15, 23, 24), "gold", "white") )

# Group labelling
bkp(bg, square=TRUE, grp.labs=paste("Level", 1:3), grp.pos=2)




