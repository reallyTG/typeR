library(mstR)


### Name: testListMST
### Title: Testing the format of the MST input lists
### Aliases: testListMST

### ** Examples


 # Creation and test of a 'start' list
 start <- list(theta = 0)
 testListMST(start, type = "start")

 # Creation and test of a 'test' list
 test <- list(method = "WL", moduleSelect = "MFI", constantPatt = "fixed4")
 testListMST(test, type = "test")

 # Creation and test of a 'final' list (with mistake)
 final <- list(method = "MAP")
 testListMST(final, type = "final")

# Creation of cut-off scores for ability levels: cut score 0 between modules 3 and 4
 # and cut scores -1 and 1 between modules 5, 6 and 7
 cut <- matrix(NA, 7, 2)
 cut[3,] <- c(-Inf, 0)
 cut[4,] <- c(0, Inf)
 cut[5,] <- c(-Inf, -1)
 cut[6,] <- c(-1, 1)
 cut[7,] <- c(1, Inf)
 test <- list(method = "WL", constantPatt = "fixed4", cutoff = cut)
 testListMST(test, "test")
 


