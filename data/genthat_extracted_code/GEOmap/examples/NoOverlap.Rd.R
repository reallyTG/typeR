library(GEOmap)


### Name: NoOverlap
### Title: Shift Symbols
### Aliases: NoOverlap
### Keywords: misc

### ** Examples

 draw.circ<-function (x, y, r, ...) 
      {
        CI = RPMG::circle(1)
        for (i in 1:length(x)) {
          Cx = x[i] + r * CI$x
          Cy = y[i] + r * CI$y
          lines(c(Cx, Cx[1]), c(Cy, Cy[1]), type = "l", ...)
        }
      }
 

 x = rnorm(20)
    y = rnorm(20)

    rx = range(x)
    ry = range(y)

    drx = diff(rx)
    dry = diff(ry)
    XPCT=.2
    rx = c(rx[1]-XPCT*drx, rx[2]+XPCT*drx)
    ry = c(ry[1]-XPCT*dry, ry[2]+XPCT*dry)



   plot(rx , ry , type='n', asp=1, xlab="km", ylab="km")

    u = par("usr")

focsiz = 0.04* (u[2]-u[1])

   draw.circ(x, y, focsiz, col='red')
 NXY = NoOverlap(x,y,focsiz)

 plot(rx , ry , type='n', asp=1, xlab="km", ylab="km")

    u = par("usr")

focsiz = 0.04* (u[2]-u[1])


draw.circ(NXY$x, NXY$y, focsiz, col="blue" )

    segments(x,y,NXY$x, NXY$y)
   




