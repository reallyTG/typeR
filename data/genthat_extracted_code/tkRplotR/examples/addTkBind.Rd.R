library(tkRplotR)


### Name: addTkBind
### Title: Add Tk Binds
### Aliases: addTkBind

### ** Examples

## Don't show: 
if (.isTclImgOk()){
tt <- tktoplevel()
tt <- tkRplot(tt, function () plot(1:10))
FUN <- local({
  canPos <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
    function (x, y) {
        x <- as.numeric(x)
        y <- as.numeric(y)
       tkdelete(tt$env$canvas, tclvalue(canPos))
           xy <- formatC(tk2usr(x, y),
                   digits = 2,
                     format = "f",
                       width = 5)
    canPos <<- .Tcl(
     paste(tt$env$canvas, "create text 40 10 -fill blue -justify left -text { ",
            xy[1], " ", xy[2],
            "} -font {Helvetica -10}"))
  }})

tkbind(tt$env$canvas, "<Motion>", FUN)
tkbind(tt$env$canvas, "<Motion>") #to give current bidings
FUN1 <- function (x,y) print(tk2usr(x,y))
addTkBind(tt$env$canvas, "<Motion>", FUN1)
tkbind(tt$env$canvas, "<Motion>") #to give current bidings
Sys.sleep(1)
tkdestroy(tt)
}
## End(Don't show)
## Not run: 
##D 
##D tt <- tktoplevel()
##D tt <- tkRplot(tt, function () plot(1:10))
##D FUN <- local({
##D   canPos <-.Tcl(paste(tt$env$canvas, "create text 0 0 "))
##D     function (x, y) {
##D         x <- as.numeric(x)
##D         y <- as.numeric(y)
##D        tkdelete(tt$env$canvas, tclvalue(canPos))
##D            xy <- formatC(tk2usr(x, y),
##D                    digits = 2,
##D                      format = "f",
##D                        width = 5)
##D     canPos <<- .Tcl(
##D      paste(tt$env$canvas, "create text 40 10 -fill blue -justify left -text { ",
##D             xy[1], " ", xy[2],
##D             "} -font {Helvetica -10}"))
##D   }})
##D 
##D tkbind(tt$env$canvas, "<Motion>", FUN)
##D tkbind(tt$env$canvas, "<Motion>") #to give current bidings
##D FUN1 <- function (x,y) print(tk2usr(x,y))
##D addTkBind(tt$env$canvas, "<Motion>", FUN1)
##D tkbind(tt$env$canvas, "<Motion>") #to give current bidings
## End(Not run)



