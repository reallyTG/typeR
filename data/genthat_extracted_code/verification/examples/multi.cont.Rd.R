library(verification)


### Name: multi.cont
### Title: Multiple Contingency Table Statistics
### Aliases: multi.cont
### Keywords: file

### ** Examples

DAT<- matrix(c(7,4,4,14,9,8,14,16,24), nrow = 3) # from p. 80 - Jolliffe
multi.cont(DAT)

DAT<- matrix(c(3,8,7,8,13,14,4,18,25), ncol = 3) ## Jolliffe JJA
multi.cont(DAT)

DAT<- matrix(c(50,47,54,91,2364,205,71,170,3288), ncol = 3) # Wilks p. 245
multi.cont(DAT)

DAT<- matrix(c(28, 23, 72, 2680 ), ncol = 2) ## Finley
multi.cont(DAT)
## Finnish clouds
DAT<- matrix(c(65, 10, 21, 29,17,48, 18, 10, 128), nrow = 3, ncol = 3, byrow = TRUE)
multi.cont(DAT)  
 ### alternatively, the verify function and summary can be used.
 
 mod <- verify(DAT, frcst.type = "cat", obs.type = "cat")
 summary(mod)
 
 


