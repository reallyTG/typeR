library(TeachingDemos)


### Name: tkexamp
### Title: Create Tk dialog boxes with controls to show examples of
###   changing parameters on a graph.
### Aliases: tkexamp
### Keywords: dynamic iplot

### ** Examples

if(interactive()) {

x <- sort( runif(25,1,10) )
y <- rnorm(25, x)

# some common plotting parameters

tke.test1 <- list(Parameters=list(
                 pch=list('spinbox',init=1,from=0,to=255,width=5),
                 cex=list('slider',init=1.5,from=0.1,to=5,resolution=0.1),
                 type=list('combobox',init='b',
                   values=c('p','l','b','o','c','h','s','S','n'),
                        width=5),
                 lwd=list('spinbox',init=1,from=0,to=5,increment=1,width=5),
                 lty=list('spinbox',init=1,from=0,to=6,increment=1,width=5)
                 ))

tkexamp( plot(x,y), tke.test1, plotloc='top' )

# different controls for the parameters

tke.test2 <- list(Parameters=list(
                 pch=list('spinbox',init=1,values=c(0:25,32:255),width=5),
                 cex=list('slider',init=1.5,from=0.1,to=5,resolution=0.1),
                 type=list('radiobuttons',init='b',
                   values=c('p','l','b','o','c','h','s','S','n'),
                        width=5),
                 lwd=list('spinbox',init=1,from=0,to=5,increment=1,width=5),
                 lty=list('spinbox',init=1,from=0,to=6,increment=1,width=5),
                 xpd=list('checkbox')
                 ))

tkexamp( plot(x,y), tke.test2, plotloc='left')

tmp <- tkexamp( plot(x,y), list(tke.test2), plotloc='right', wait=TRUE )

# now recreate the plot
tmp$x <- x
tmp$xlab <- 'x'
tmp$y <- y
tmp$ylab <- 'y'
do.call('plot', tmp)

# a non plotting example

tke.test3 <- list(
        sens=list('slider', init=0.95, from=0.9, to=1, resolution=0.005),
        spec=list('slider', init=0.9, from=0.8, to=1, resolution=0.005),
        prev=list('slider', init=0.01, from=0.0001, to=0.1, resolution=0.0001),
        step=list('spinbox', init=1, from=1, to=11, width=5),
        n=list('numentry',init=100000, width=7)
)

options(scipen=1)
tkexamp( SensSpec.demo(), tke.test3 )
# now increment step and watch the console

# Above example but converting it to plot

tempfun <- function(sens,spec,prev,step,n) {
	if(missing(sens) || missing(n)) return(invisible(NULL))
	tmp <- capture.output( SensSpec.demo(sens=sens,spec=spec,
				prev=prev, n=n, step=step) )
	par(cex=2.25)
	plot.new()
	tmp2 <- strheight(tmp)
	text(0, 1-cumsum(tmp2*1.5), tmp, family='mono', adj=0)
	title('Sensitivity and Specificity Example')
}

tkexamp( tempfun(), tke.test3, hscale=4, vscale=2 )

# an example using trellis graphics

tke.test4 <- list(
   alpha=list('slider', from=0,to=1,init=1,
                resolution=0.05),
   cex=list('spinbox',init=.8,from=.1,to=3,increment=.1,width=5),
   col=list('entry',init='#0080ff'),
   pch=list('spinbox',init=1, from=0,to=255,
                increment=1,width=5),
   fill=list('entry',init='transparent')
)

tempfun <- function(x,y,alpha,cex,col,pch,fill) {
	if(missing(alpha) || missing(cex)) {return()}
	trellis.par.set(plot.symbol=list(alpha=alpha, cex=cex, col=col,
					font=1,pch=pch,fill=fill))
	print(xyplot( y~x ))
}

require(lattice)

tkexamp( tempfun(x,y), list(tke.test4), plotloc='left')


# Two example using ggplot2

if( require(ggplot2) ) {

##  1
  tkexamp( qplot(cty,data=mpg, geom='histogram'),
      list(binwidth=list('slider',from=1,to=25)),
      print=TRUE)

##  2
  tmpfun <- function(bw=2){
	print(ggplot(mpg, aes(cty)) +
  		geom_histogram(binwidth = bw))
  }

  tkexamp( tmpfun, list(bw=list('slider',from=1, to=5)))


}

}



