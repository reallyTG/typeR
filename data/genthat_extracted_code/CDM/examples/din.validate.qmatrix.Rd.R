library(CDM)


### Name: din.validate.qmatrix
### Title: Q-Matrix Validation (Q-Matrix Modification) for Mixed DINA/DINO
###   Model
### Aliases: din.validate.qmatrix
### Keywords: Q-matrix validation

### ** Examples

#############################################################################
# EXAMPLE 1: Detection of a mis-specified Q-matrix
#############################################################################

set.seed(679)
# specify true Q-matrix
q.matrix <- matrix( 0, 12, 3 )
q.matrix[1:3,1] <- 1
q.matrix[4:6,2] <- 1
q.matrix[7:9,3] <- 1
q.matrix[10,] <- c(1,1,0)
q.matrix[11,] <- c(1,0,1)
q.matrix[12,] <- c(0,1,1)
# simulate data
dat <- CDM::sim.din( N=4000, q.matrix)$dat
# incorrectly modify Q-matrix rows 1 and 10
Q1 <- q.matrix
Q1[1,] <- c(1,1,0)
Q1[10,] <- c(1,0,0)
# estimate DINA model
mod <- CDM::din( dat, q.matr=Q1, rule="DINA")
# apply Q-matrix validation
res <- CDM::din.validate.qmatrix( mod )
  ## item itemindex Skill1 Skill2 Skill3 guess  slip   IDI qmatrix.orig IDI.orig delta.IDI max.IDI
  ## I001         1      1      0      0 0.309 0.251 0.440            0    0.431     0.009   0.440
  ## I010        10      1      1      0 0.235 0.329 0.437            0    0.320     0.117   0.437
  ## I010        10      1      1      1 0.296 0.301 0.403            0    0.320     0.083   0.437
  ##
  ##   Proposed Q-matrix:
  ##
  ##          Skill1 Skill2 Skill3
  ##   Item1       1      0      0
  ##   Item2       1      0      0
  ##   Item3       1      0      0
  ##   Item4       0      1      0
  ##   Item5       0      1      0
  ##   Item6       0      1      0
  ##   Item7       0      0      1
  ##   Item8       0      0      1
  ##   Item9       0      0      1
  ##   Item10      1      1      0
  ##   Item11      1      0      1
  ##   Item12      0      1      1

## Not run: 
##D #*****************
##D # Q-matrix estimation ('Qrefine') in the NPCD package
##D # See Chiu (2013, APM).
##D #*****************
##D 
##D library(NPCD)
##D Qrefine.out <- NPCD::Qrefine( dat, Q1, gate="AND", max.ite=50)
##D print(Qrefine.out)
##D   ##   The modified Q-matrix
##D   ##           Attribute 1 Attribute 2 Attribute 3
##D   ##   Item 1            1           0           0
##D   ##   Item 2            1           0           0
##D   ##   Item 3            1           0           0
##D   ##   Item 4            0           1           0
##D   ##   Item 5            0           1           0
##D   ##   Item 6            0           1           0
##D   ##   Item 7            0           0           1
##D   ##   Item 8            0           0           1
##D   ##   Item 9            0           0           1
##D   ##   Item 10           1           1           0
##D   ##   Item 11           1           0           1
##D   ##   Item 12           0           1           1
##D   ##
##D   ##   The modified entries
##D   ##        Item Attribute
##D   ##   [1,]    1         2
##D   ##   [2,]   10         2
##D 
##D plot(Qrefine.out)
## End(Not run)



