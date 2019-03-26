library(optiSel)


### Name: matings
### Title: Mate Allocation
### Aliases: matings

### ** Examples


data("map")
data("Cattle")
dir   <- system.file("extdata", package = "optiSel")
files <- paste(dir, "/Chr", 1:2, ".phased", sep="")

sKin  <- segIBD(files, map, minSNP=20, minL=2.0)
Phen  <- Cattle[Cattle$Breed=="Angler", ]

cont  <- data.frame(
  age   = c(   1,    2,    3,    4,    5,    6), 
  male  = c(0.11, 0.11, 0.10, 0.08, 0.06, 0.04),
  female= c(0.11, 0.11, 0.10, 0.08, 0.06, 0.04))

cand  <- candes(phen=Phen, sKin = sKin, cont=cont)
con   <- list(uniform="female", ub.sKin = 0.047)
Offspring <- opticont("max.BV", cand, con, trace=FALSE)


#####  Minimize inbreeding   #####
Candidate   <- Offspring$parent
Candidate$n <- noffspring(Candidate, N=20)$nOff
Mating      <- matings(Candidate, sKin)
Mating 
attributes(Mating)$objval


## Not run: 
##D ## This is faster but not available on all platforms:
##D library("Rsymphony")
##D Mating <- matings(Candidate, sKin, alpha=0.30, solver=Rsymphony_solve_LP)
##D Mating
##D attributes(Mating)$objval
##D 
##D attributes(Mating)$info
##D #[1] "Optimum solution found"
## End(Not run)




