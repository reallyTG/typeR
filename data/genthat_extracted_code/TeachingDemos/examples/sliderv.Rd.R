library(TeachingDemos)


### Name: sliderv
### Title: Create a Tk slider window
### Aliases: sliderv
### Keywords: dynamic iplot

### ** Examples

if(interactive()){
face.refresh <- function(...){
	vals <- sapply(1:15, function(x) slider(no=x))
	faces( rbind(0, vals, 1), scale=F)
}

sliderv( face.refresh, as.character(1:15), rep(0,15), rep(1,15),
	rep(0.05, 15), rep(0.5,15), title='Face Demo')
}



