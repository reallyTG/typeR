library(tkRplotR)


### Name: tkRplot
### Title: Tk Rplot With Resizing
### Aliases: tkRplot tkRreplot

### ** Examples

## Don't show: 
 if (.isTclImgOk()){
 bb <- 1
tkbb <- tclVar(1)
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

 f <- function(...) {
 b <- as.numeric(tclvalue(tkbb))
   if (b != bb) {
       bb <<- b
           tkRreplot(tt)
             }
     }

     s <-
       tkscale(
       tt,
       command = f,
       from = 0.05,
       to = 2.00,
       variable = tkbb,
       showvalue = FALSE,
       resolution = 0.05,
       orient = "horiz"
       )

       tkpack(s,
       side = "bottom",
       expand = FALSE,
       fill = "both")
       Sys.sleep(1)
       tkdestroy(tt)
       }
## End(Don't show)
## Not run: 
##D bb <- 1
##D tkbb <- tclVar(1)
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
##D  f <- function(...) {
##D  b <- as.numeric(tclvalue(tkbb))
##D    if (b != bb) {
##D        bb <<- b
##D            tkRreplot(tt)
##D              }
##D      }
##D 
##D      s <-
##D        tkscale(
##D        tt,
##D        command = f,
##D        from = 0.05,
##D        to = 2.00,
##D        variable = tkbb,
##D        showvalue = FALSE,
##D        resolution = 0.05,
##D        orient = "horiz"
##D        )
##D 
##D        tkpack(s,
##D        side = "bottom",
##D        expand = FALSE,
##D        fill = "both")
##D 
## End(Not run)



