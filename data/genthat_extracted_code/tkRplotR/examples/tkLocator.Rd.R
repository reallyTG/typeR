library(tkRplotR)


### Name: tkLocator
### Title: Gives the Position
### Aliases: tkLocator

### ** Examples

## Not run: 
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
##D  tkLocator(tt, 2)
##D  
## End(Not run)




