library(TeachingDemos)


### Name: subplot
### Title: Embed a new plot within an existing plot
### Aliases: subplot
### Keywords: aplot dplot

### ** Examples

# make an original plot
plot( 11:20, sample(51:60) )

# add some histograms

subplot( hist(rnorm(100)), 15, 55)
subplot( hist(runif(100),main='',xlab='',ylab=''), 11, 51, hadj=0, vadj=0)
subplot( hist(rexp(100, 1/3)), 20, 60, hadj=1, vadj=1, size=c(0.5,2) )
subplot( hist(rt(100,3)), c(12,16), c(57,59), pars=list(lwd=3,ask=FALSE) )

### some of the following examples work fine in an interactive session,
### but loading the packages required does not work well in testing.

# augment a map
if( interactive() && require(maptools) ){
	plot(state.vbm,fg=NULL)
	tmp <- cbind( state.vbm$center_x, state.vbm$center_y )
	for( i in 1:50 ){
		tmp2 <- as.matrix(USArrests[i,c(1,4)])
		tmp3 <- max(USArrests[,c(1,4)])
		subplot( barplot(tmp2, ylim=c(0,tmp3),names=c('',''),yaxt='n'),
			x=tmp[i,1], y=tmp[i,2], size=c(.1,.1))
	}
}

tmp <- rnorm(25)
qqnorm(tmp)
qqline(tmp)
tmp2 <- subplot( hist(tmp,xlab='',ylab='',main=''),
		grconvertX(0.1,from='npc'), grconvertY(0.9,from='npc'), 
		vadj=1, hadj=0 )
abline(v=0, col='red') # wrong way to add a reference line to histogram

# right way to add a reference line to histogram
op <- par(no.readonly=TRUE)
par(tmp2)
abline(v=0, col='green')
par(op)


# scatter-plot using images
if(interactive() && require(png)) {

  image.png <- function(x,...) {
    cols <- rgb( x[,,1], x[,,2], x[,,3], x[,,4] )
    z <- 1:length(cols)
    dim(z) <- dim(x[,,1])
    z <- t(z)
    z <- z[ ,rev(seq_len(ncol(z))) ]
    image(z, col=cols, axes=FALSE, ...)
  }

  logo <- readPNG(system.file("img", "Rlogo.png", package="png"))

  x <- runif(10)
  y <- runif(10)
  plot(x,y, type='n')
  for(i in 1:10) {
    subplot(image.png(logo), x[i], y[i], size=c(0.3,0.3))
  }
}




