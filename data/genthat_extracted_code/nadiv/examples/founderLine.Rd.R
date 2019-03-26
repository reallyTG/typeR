library(nadiv)


### Name: founderLine
### Title: Identifies the matriline or patriline to which each individual
###   in a pedigree belongs
### Aliases: founderLine

### ** Examples


 founderLine(FG90, sex = "dam")  # matriline from this example pedigree

 #Create random pedigree, tracking the matrilines
 ## Then compare with founderLine() output
 K <- 8  # No. individuals per generation (KEEP and even number)
 gen <- 10 # No. of generations
 datArr <- array(NA, dim = c(K, 5, gen))
 dimnames(datArr) <- list(NULL, 
c("id", "dam", "sire", "sex", "matriline"), NULL)
 # initialize the data array
 datArr[, "id", ] <- seq(K*gen)
 datArr[, "sex", ] <- c(1, 2)
 femRow <- which(datArr[, "sex", 1] == 2) # assume this is same each generation
 # (Why K should always be an even number)
 datArr[femRow, "matriline", 1] <- femRow
 # males have overlapping generations, BUT females DO NOT
 for(g in 2:gen){
   datArr[, "sire", g] <- sample(c(datArr[femRow-1, "id", 1:(g-1)]),
size = K, replace = TRUE)
   gdams <- sample(femRow, size = K, replace = TRUE)
   datArr[, c("dam", "matriline"), g] <- datArr[gdams, c("id", "matriline"), g-1]
 }
 ped <- data.frame(apply(datArr, MARGIN = 2, FUN = function(x){x}))
 nrow(ped)
 #Now run founderLine() and compare
 ped$line <- founderLine(ped, sex = "dam")
 stopifnot(identical(ped$matriline, ped$line),
	sum(ped$matriline-ped$line, na.rm = TRUE) == 0,
	range(ped$matriline-ped$line, na.rm = TRUE) == 0)





