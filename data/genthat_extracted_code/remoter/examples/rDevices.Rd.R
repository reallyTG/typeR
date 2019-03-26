library(remoter)


### Name: rDevices
### Title: Local Graphic Devices
### Aliases: rDevices dev.curc dev.listc dev.nextc dev.prevc dev.offc
###   dev.setc dev.newc dev.sizec

### ** Examples

## Not run: 
##D ### Prompts are listed to clarify when something is eval'd locally vs
##D ### remotely
##D > library(remoter, quietly = TRUE)
##D > client()
##D 
##D remoter> rpng.new(plot(1:5))
##D remoter> dev.newc(width = 6, height = 4)
##D remoter> a <- function() plot(iris$Sepal.Length, iris$Petal.Length)
##D remoter> rpng.new(a, width = 6 * 72, height = 4 * 72)
##D 
##D remoter> dev.curc()
##D remoter> dev.listc()
##D remoter> dev.offc()
##D 
##D remoter> q()
##D >
## End(Not run)




