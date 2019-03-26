library(nadiv)


### Name: makeAstarMult
### Title: Creates the inverse additive genetic relationship matrix with
###   genetic groups
### Aliases: makeAstarMult

### ** Examples


 # Using the Q1988 dataset in nadiv
 ## assign a null fuzzy classification matrix
 QfuzzNull <- matrix(c(1,0,0,1,0, 0,1,1,0,1), nrow = 5, ncol = 2,
	dimnames = list(letters[1:5], c("g1", "g2")))

 # Type A
 ## no fuzzy classification
  Astar_A <- makeAstarMult(Q1988[-c(3:7), c(1,4,5)], ggroups = 2)
 ## with fuzzy classification
  Astar_Afuzzy <- makeAstarMult(Q1988[, c(1, 6, 7)],
	ggroups = 2, fuzz = QfuzzNull)

 # Type D
 ## no fuzzy classification
  Astar_D <- makeAstarMult(Q1988[-c(1:7), c(1, 4, 5)], ggroups = c("g1", "g2"))
 ## with fuzzy classification
  Astar_Dfuzzy <- makeAstarMult(Q1988[-c(1:2), c(1, 6, 7)],
	ggroups = c("g1", "g2"), fuzz = QfuzzNull)


 # Obtain the matrix directly 
 ## no fuzzy classification
 Astar_direct <- makeAinv(Q1988[-c(3:7), c(1,4,5)], ggroups = 2)$Ainv
 stopifnot(length(drop0(round(Astar_direct
	- (Astar_A - Astar_Afuzzy)
	- (Astar_D - Astar_Dfuzzy)
	- Astar_direct, 10))@x) == 0)

 ## with fuzzy classification
 Astar_directF <- makeAinv(Q1988[-c(1:2), c(1, 6, 7)], fuzz = QfuzzNull)$Ainv
 stopifnot(length(drop0(round(Astar_directF
	- (Astar_A - Astar_Afuzzy)
	- (Astar_D - Astar_Dfuzzy)
	- Astar_direct, 10))@x) == 0)
 




