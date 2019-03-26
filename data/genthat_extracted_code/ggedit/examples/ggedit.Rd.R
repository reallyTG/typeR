library(ggedit)


### Name: ggedit
### Title: Interactive shiny gadget for editing ggplot layers and themes.
### Aliases: ggedit

### ** Examples

p <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width))

p <- p + 
ggplot2::geom_point(ggplot2::aes(colour=Species)) + 
ggplot2::geom_line()

if(interactive()){
## Not run: 
##D pnew <- ggedit(p)
##D pnew
## End(Not run)
}



