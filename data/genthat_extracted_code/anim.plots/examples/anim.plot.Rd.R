library(anim.plots)


### Name: anim.plot
### Title: Create an animated plot.
### Aliases: anim.plot anim.points anim.lines anim.text anim.plot.default
###   anim.plot.formula anim.points.default anim.lines.default
###   anim.text.default anim.symbols anim.points.formula anim.lines.formula
###   anim.text.formula

### ** Examples

x <- rep(1:100/10, 10)
times <- rep(1:10, each=100)
y <- sin(x*times/4)
anim.plot(x,y,times, type="l", col="orange", lwd=2)

## changing colours - a per-point parameter
anim.plot(x,y,times, ylab="Sine wave", type="p", col=rainbow(100)[x *10])

## changing line width - a whole-plot parameter
anim.plot(x, y, times, lwd=1:10, type="l")
          
## times as a single number
anim.plot(1:10, 1:10, times=5)
           
## incremental plot
anim.plot(1:10, 1:10, window=1:t)

## moving window
anim.plot(1:10, 1:10, window=(t-2):t)

## Formula interface
ChickWeight$chn <- as.numeric(as.factor(ChickWeight$Chick))
tmp <- anim.plot(weight ~ chn + Time, data=ChickWeight, col=as.numeric(Diet), 
     pch=as.numeric(Diet), speed=3)

# adding extra arguments:
replay(tmp, after=legend("topleft", legend=paste("Diet", 1:4), pch=1:4, col=1:4))
 
 ## Zooming in:
 x <- rnorm(4000); y<- rnorm(4000)
 x <- rep(x, 10); y <- rep(y, 10)
 xlims <- 4*2^(-(1:10/10))
 ylims <- xlims <- rbind(xlims, -xlims) 
 anim.plot(x, y, times=10, speed=5, xlim=xlims, ylim=ylims, 
       col=rgb(0,0,0,.3), pch=19)
 
 ## window.process to create a faded "trail":
 anim.plot(1:50, 1:50, speed=12, window=t:(t+5), 
       window.process=function(args, times){
         times <- times - min(times) 
         alpha <- times/max(times)
         alpha[is.na(alpha)] <- 1
         args$col <- rgb(0,0,0, alpha)
         return(args)
       })
       
 ## gapminder plot:
 pl <- palette(adjustcolor(rainbow(23), 1, .6, .6, .6, 
       offset=c(0,0,0,-0.1)))
 anim.plot(lifex ~ GDP + year, data=gm_data, log="x", 
      cex=sqrt(pop)*0.0004, pch=19, col=region, xlab="GDP", 
      ylab="Life expectancy", speed=10, subset=year > 1850 & !year %% 5)
 palette(pl)
 
 ## Not run: 
##D  ## Earthquakes this week
##D  if (require('maps')) {
##D    eq = read.table(
##D        file="http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt", 
##D        fill=TRUE, sep=",", header=TRUE)
##D    eq$time <- as.numeric(strptime(eq$Datetime, "%A, %B %d, %Y %X UTC"))
##D  eq <- eq[-1,]
##D    map('world')
##D    maxdepth <- max(max(eq$Depth), 200)
##D    tmp <- anim.points(Lat ~ Lon + time, data=eq, cex=Magnitude, col=rgb(
##D          1-Depth/maxdepth, 0, Depth/maxdepth,.7), pch=19, speed=3600*12, 
##D          show=FALSE)   
##D    replay(tmp, before=map('world', fill=TRUE, col="wheat"))
##D  }
##D  
##D  
##D  ## Minard's plot
##D  if (require('maps')) {
##D    map('world', xlim=c(22, 40), ylim=c(52,58))
##D    title("March of the Grande Armee on Moscow")
##D    points(cities$long, cities$lat, pch=18)
##D    text(cities$long, cities$lat, labels=cities$city, pos=4, cex=.7)
##D    with(troops[troops$group==1,], anim.lines(x=long, 
##D          y=lat, window=t:(t+1), speed=3, lwd=survivors/10000))
##D }
## End(Not run)



