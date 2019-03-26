library(TeachingDemos)


### Name: tkBrush
### Title: Change the Color and Styles of points interactively
### Aliases: tkBrush
### Keywords: hplot iplot dynamic

### ** Examples

if(interactive()){

# Iris dataset

out1 <- tkBrush(iris)

#  Now brush the points

pairs(iris, col=out1$col, pch=out1$pch)

# or

colhist <- function(x,...){
    tmp <- hist(x,plot=F)
    br <- tmp$breaks
    w <- as.numeric(cut(x,br,include.lowest=TRUE))
    sy <- unlist(lapply(tmp$counts,function(x)seq(length=x)))
    my <- max(sy)
    sy <- sy/my
    my <- 1/my
    sy <- sy[order(order(x))]
    tmp.usr <- par('usr'); on.exit(par(usr=tmp.usr))
    par(usr=c(tmp.usr[1:2],0,1.5))
    rect(br[w], sy-my, br[w+1], sy, 
       col=out1$col, # note out1$col is hardcoded here.
       border=NA)
    rect(br[-length(br)], 0, br[-1], tmp$counts*my)
}
pairs(iris, col=out1$col, pch=out1$pch, diag.panel=colhist)


# some spheres

s1 <- matrix(nrow=0,ncol=3)

while( nrow(s1) < 1000 ){
	tmp <- rnorm(3)
	if( sum(tmp^2) <= 1 ){
		s1 <- rbind(s1,tmp)
	}
}

s2 <- matrix(rnorm(3000), ncol=3)
s2 <- s2/apply(s2,1,function(x) sqrt(sum(x^2)))

tkBrush(s1, wait=FALSE)
tkBrush(s2, wait=FALSE)

# now paint values where var 2 is close to 0 in both plots 
# and compare the var 1 and var 3 relationship

}



