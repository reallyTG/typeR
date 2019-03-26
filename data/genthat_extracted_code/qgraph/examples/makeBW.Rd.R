library(qgraph)


### Name: makeBW
### Title: A qgraph plot can be understood in black and white
### Aliases: makeBW
### Keywords: black white

### ** Examples


set.seed(1)
x <- cor(matrix(rnorm(25), nrow = 5))
colors <- c("red", "red", "blue", "blue", "white")

# colored qgraph plot
qg <- qgraph(x, colors = colors)

# randomly assing motifs to colors (notice that white nodes stay white)
makeBW(qg)
# associate a motif only to one of the colors
makeBW(qg, colorlist = c("blue"))
# define an order, which allows to choose motifs
makeBW(qg, colorlist = c("blue", "red"))
makeBW(qg, colorlist = c("red", "blue"))



