library(gridExtra)


### Name: arrangeGrob
### Title: Arrange multiple grobs on a page
### Aliases: arrangeGrob grid.arrange marrangeGrob grid.arrange
###   marrangeGrob

### ** Examples

library(grid)
grid.arrange(rectGrob(), rectGrob())
## Not run: 
##D  
##D library(ggplot2)
##D pl <- lapply(1:11, function(.x) qplot(1:10, rnorm(10), main=paste("plot", .x)))
##D ml <- marrangeGrob(pl, nrow=2, ncol=2)
##D ## non-interactive use, multipage pdf
##D ggsave("multipage.pdf", ml)
##D ## interactive use; open new devices
##D ml
## End(Not run)



