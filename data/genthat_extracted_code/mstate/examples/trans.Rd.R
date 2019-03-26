library(mstate)


### Name: transMat
### Title: Define transition matrix for multi-state model
### Aliases: transMat trans.illdeath trans.comprisk
### Keywords: array

### ** Examples

transMat(list(c(2, 3), c(), c(1, 2)),
	names = c("Disease-free", "Death", "Relapsed"))
tmat <- transMat(x = list( c(2, 3), c(1, 3), c() ),
                 names = c("Normal", "Low", "Death"))
tmat
transListn <- list("Normal" = c(2, 3), "Low" = c(1, 3), "Death" = c())
transMat(transListn)
trans.comprisk(3)
trans.comprisk(3,c("c1","c2","c3"))
trans.comprisk(3,c("nothing","c1","c2","c3"))
trans.illdeath()
trans.illdeath(c("nothing","ill","death"))



