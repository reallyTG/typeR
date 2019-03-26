library(TSP)


### Name: TSPLIB
### Title: Read and write TSPLIB files
### Aliases: TSPLIB write_TSPLIB write_TSPLIB.TSP write_TSPLIB.ATSP
###   write_TSPLIB.ETSP read_TSPLIB
### Keywords: file

### ** Examples

## Drilling problem from TSP
drill <- read_TSPLIB(system.file("examples/d493.tsp", package = "TSP"))
drill
tour <- solve_TSP(drill, method = "nn", two_opt = TRUE)
tour
plot(drill, tour, cex=.6, col = "red", pch= 3, main = "TSPLIB: d493")

  
## Write and read data in TSPLIB format
x <- data.frame(x=runif(5), y=runif(5))

## create TSP, ATSP and ETSP (2D)
tsp <- TSP(dist(x))
atsp <- ATSP(dist(x))
etsp <- ETSP(x[,1:2])  
  
write_TSPLIB(tsp, file="example.tsp")
#file.show("example.tsp")
r <- read_TSPLIB("example.tsp")  
r  
  
write_TSPLIB(atsp, file="example.tsp")
#file.show("example.tsp")
r <- read_TSPLIB("example.tsp")  
r  
  
write_TSPLIB(etsp, file="example.tsp")
#file.show("example.tsp")
r <- read_TSPLIB("example.tsp")  
r  
  
## clean up
unlink("example.tsp")



