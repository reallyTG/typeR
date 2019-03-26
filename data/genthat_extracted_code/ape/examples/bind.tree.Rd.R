library(ape)


### Name: bind.tree
### Title: Binds Trees
### Aliases: bind.tree +.phylo
### Keywords: manip

### ** Examples

### binds the two clades of bird orders
cat("((Struthioniformes:21.8,Tinamiformes:21.8):4.1,",
    "((Craciformes:21.6,Galliformes:21.6):1.3,Anseriformes:22.9):3.0):2.1;",
    file = "ex1.tre", sep = "\n")
cat("(Turniciformes:27.0,(Piciformes:26.3,((Galbuliformes:24.4,",
    "((Bucerotiformes:20.8,Upupiformes:20.8):2.6,",
    "(Trogoniformes:22.1,Coraciiformes:22.1):1.3):1.0):0.6,",
    "(Coliiformes:24.5,(Cuculiformes:23.7,(Psittaciformes:23.1,",
    "(((Apodiformes:21.3,Trochiliformes:21.3):0.6,",
    "(Musophagiformes:20.4,Strigiformes:20.4):1.5):0.6,",
    "((Columbiformes:20.8,(Gruiformes:20.1,Ciconiiformes:20.1):0.7):0.8,",
    "Passeriformes:21.6):0.9):0.6):0.6):0.8):0.5):1.3):0.7):1.0;",
    file = "ex2.tre", sep = "\n")
tree.bird1 <- read.tree("ex1.tre")
tree.bird2 <- read.tree("ex2.tre")
unlink(c("ex1.tre", "ex2.tre")) # clean-up
(birds <- tree.bird1 + tree.bird2)
layout(matrix(c(1, 2, 3, 3), 2, 2))
plot(tree.bird1)
plot(tree.bird2)
plot(birds)

### examples with random trees
x <- rtree(4, tip.label = LETTERS[1:4])
y <- rtree(4, tip.label = LETTERS[5:8])
x <- makeNodeLabel(x, prefix = "x_")
y <- makeNodeLabel(y, prefix = "y_")
x$root.edge <- y$root.edge <- .2

z <- bind.tree(x, y, po=.2)
plot(y, show.node.label = TRUE, font = 1, root.edge = TRUE)
title("y")
plot(x, show.node.label = TRUE, font = 1, root.edge = TRUE)
title("x")
plot(z, show.node.label = TRUE, font = 1, root.edge = TRUE)
title("z <- bind.tree(x, y, po=.2)")

z <- bind.tree(x, y, 2, .1)
plot(y, show.node.label = TRUE, font = 1, root.edge = TRUE)
title("y")
plot(x, show.node.label = TRUE, font = 1, root.edge = TRUE)
title("x")
plot(z, show.node.label = TRUE, font = 1, root.edge = TRUE)
title("z <- bind.tree(x, y, 2, .1)")

x <- rtree(50)
y <- rtree(50)
x$root.edge <- y$root.edge <- .2
z <- x + y
plot(y, show.tip.label = FALSE, root.edge = TRUE); axisPhylo()
title("y")
plot(x, show.tip.label = FALSE, root.edge = TRUE); axisPhylo()
title("x")
plot(z, show.tip.label = FALSE, root.edge = TRUE); axisPhylo()
title("z <- x + y")
layout(1)



