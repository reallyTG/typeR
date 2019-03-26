library(tkRplotR)


### Name: getCoef
### Title: Functions to Convert Tk and User Coordinates
### Aliases: getCoef tk2usr

### ** Examples

## Don't show: 
if (.isTclImgOk()){
bb <- 1
tt <- tktoplevel()
tt <- tkRplot(tt, function() {
 x <- 1:20 / 20
   plot(
   x,
   x ^ bb,
   col = "#0000ff50",
       xlab = "x",
           ylab = paste0("x^", bb),
               type = "l",
                   axes = FALSE,
                       lwd = 4)
   title(main = bb)
     points(x,
      x ^ bb,
      col = "#ff000050",
      pch = 19,
      cex = 2)
        axis(1)
        axis(2)
          box()
          })

 getCoef()

 tkbind(tt$env$canvas, "<Button-1>", function(x, y)
 print(tk2usr(x, y)))

 # A more complex example
 local({
 canPos <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
 canPosX <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
 canPosY <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
 lineVertical <- .Tcl(paste(tt$env$canvas, "create line 0 0 0 0"))
 lineHorizontal<-.Tcl(paste(tt$env$canvas, "create line 0 0 0 0"))
 tkbind(tt, "<Motion>", function (x, y) {
   x <- as.numeric(x)
     y <- as.numeric(y)
       for (i in c(canPos, lineVertical, lineHorizontal,canPosX,canPosY))
       tkdelete(tt$env$canvas, tclvalue(i))
            xy <- formatC(tk2usr(x, y),
                            digits = 2,
                             format = "f",
                              width = 5)

xRange <- tt$env$plt[1:2] * tt$env$width
  yRange <- (1 - tt$env$plt[4:3]) * tt$env$height
    canPos <<- .Tcl(
 paste(tt$env$canvas, "create text 40 10 -fill blue -justify left -text { ",
     xy[1], " ", xy[2],
     "} -font {Helvetica -10}"))
      if (x < xRange[1] | x > xRange[2])
         return()
         if (y < yRange[1] | y > yRange[2])
           return()
canPosX <<- .Tcl(paste(tt$env$canvas, "create text ", x, yRange[1]-10,
           " -fill blue -justify center -text { ",xy[1],
           "} -font {Helvetica -10}"))
canPosY <<- .Tcl(paste(tt$env$canvas, "create text ",xRange[2]+10, y,
   " -fill blue -justify center -text { ",xy[2], "} -font {Helvetica -10}"))
           lineVertical <<- .Tcl(paste(tt$env$canvas, "create line ",
                 x,      yRange[1],      x,      yRange[2],
                    "-fill blue -dash 4"))
           lineHorizontal <<- .Tcl(paste(tt$env$canvas,
                 "create line ",
                  xRange[1],  y, xRange[2], y,
                        "-fill blue -dash 4"))})
     tkbind(tt$env$canvas, "<Leave>", function (x, y)
     {tkdelete(tt$env$canvas, tclvalue(canPos))})
     } )
     Sys.sleep(1)
     tkdestroy(tt)
}
## End(Don't show)
## Not run: 
##D 
##D bb <- 1
##D tt <- tktoplevel()
##D tt <- tkRplot(tt, function() {
##D  x <- 1:20 / 20
##D    plot(
##D    x,
##D    x ^ bb,
##D    col = "#0000ff50",
##D        xlab = "x",
##D            ylab = paste0("x^", bb),
##D                type = "l",
##D                    axes = FALSE,
##D                        lwd = 4)
##D    title(main = bb)
##D      points(x,
##D       x ^ bb,
##D       col = "#ff000050",
##D       pch = 19,
##D       cex = 2)
##D         axis(1)
##D         axis(2)
##D           box()
##D           })
##D 
##D  getCoef()
##D 
##D  tkbind(tt$env$canvas, "<Button-1>", function(x, y)
##D  print(tk2usr(x, y)))
##D 
##D  # A more complex example
##D  local({
##D  canPos <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
##D  canPosX <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
##D  canPosY <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
##D  lineVertical <- .Tcl(paste(tt$env$canvas, "create line 0 0 0 0"))
##D  lineHorizontal<-.Tcl(paste(tt$env$canvas, "create line 0 0 0 0"))
##D  tkbind(tt, "<Motion>", function (x, y) {
##D    x <- as.numeric(x)
##D      y <- as.numeric(y)
##D        for (i in c(canPos, lineVertical, lineHorizontal,canPosX,canPosY))
##D        tkdelete(tt$env$canvas, tclvalue(i))
##D             xy <- formatC(tk2usr(x, y),
##D                             digits = 2,
##D                              format = "f",
##D                               width = 5)
##D 
##D xRange <- tt$env$plt[1:2] * tt$env$width
##D   yRange <- (1 - tt$env$plt[4:3]) * tt$env$height
##D     canPos <<- .Tcl(
##D  paste(tt$env$canvas, "create text 40 10 -fill blue -justify left -text { ",
##D      xy[1], " ", xy[2],
##D      "} -font {Helvetica -10}"))
##D       if (x < xRange[1] | x > xRange[2])
##D          return()
##D          if (y < yRange[1] | y > yRange[2])
##D            return()
##D canPosX <<- .Tcl(paste(tt$env$canvas, "create text ", x, yRange[1]-10,
##D            " -fill blue -justify center -text { ",xy[1],
##D            "} -font {Helvetica -10}"))
##D canPosY <<- .Tcl(paste(tt$env$canvas, "create text ",xRange[2]+10, y,
##D    " -fill blue -justify center -text { ",xy[2], "} -font {Helvetica -10}"))
##D            lineVertical <<- .Tcl(paste(tt$env$canvas, "create line ",
##D                  x,      yRange[1],      x,      yRange[2],
##D                     "-fill blue -dash 4"))
##D            lineHorizontal <<- .Tcl(paste(tt$env$canvas,
##D                  "create line ",
##D                   xRange[1],  y, xRange[2], y,
##D                         "-fill blue -dash 4"))})
##D      tkbind(tt$env$canvas, "<Leave>", function (x, y)
##D      {tkdelete(tt$env$canvas, tclvalue(canPos))})
##D      } )
##D 
##D  
## End(Not run)



