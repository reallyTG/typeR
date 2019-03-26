library(statGraph)


### Name: ghoshdastidar
### Title: Ghoshdastidar hypothesis testing for large random graphs.
### Aliases: ghoshdastidar

### ** Examples

require(igraph)
set.seed(42)

## test for sets with more than one graph each under H0
x <- y <- list()
for(i in 1:10){
  x[[i]] <- as.matrix(get.adjacency(erdos.renyi.game(50,0.6)))
  y[[i]] <- as.matrix(get.adjacency(erdos.renyi.game(50,0.6)))
}
D <- ghoshdastidar(x, y, printResult = TRUE)

## test for sets with more than one graph each under H1
x <- y <- list()
for(i in 1:10){
  x[[i]] <- as.matrix(get.adjacency(erdos.renyi.game(50,0.6)))
  y[[i]] <- as.matrix(get.adjacency(erdos.renyi.game(50,0.7)))
}
D <- ghoshdastidar(x, y, printResult = TRUE)

## test for sets with only one graph each under H0
x <- y <- list()
x[[1]] <- erdos.renyi.game(300, 0.6)
y[[1]] <- erdos.renyi.game(300, 0.6)
D <- ghoshdastidar(x, y, two.sample= TRUE, printResult = TRUE)

## test for sets with only one graph each under H1
x <- y <- list()
x[[1]] <- erdos.renyi.game(300, 0.6)
y[[1]] <- erdos.renyi.game(300, 0.7)
D <- ghoshdastidar(x, y, two.sample= TRUE, printResult = TRUE)





