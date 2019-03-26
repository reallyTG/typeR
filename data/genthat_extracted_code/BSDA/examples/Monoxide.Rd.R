library(BSDA)


### Name: Monoxide
### Title: Carbon monoxide emitted by smoke stacks of a manufacturer and a
###   competitor
### Aliases: Monoxide
### Keywords: datasets

### ** Examples


boxplot(emission ~ company, data = Monoxide, col = topo.colors(2))
t.test(emission ~ company, data = Monoxide)
wilcox.test(emission ~ company, data = Monoxide)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Monoxide, aes(x = company, y = emission)) + 
##D            geom_boxplot() + 
##D            theme_bw()
## End(Not run)




