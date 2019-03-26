library(mstR)


### Name: randomMST
### Title: Random generation of multistage tests (dichotomous and
###   polytomous models)
### Aliases: randomMST print.mst plot.mst

### ** Examples


## Dichotomous models ##

  # Generation of an item bank under 2PL, made of 7 successive modules that target
 # different average ability levels and with different lengths
 # (the first generated item parameters hold two modules of 8 items each)
 it <- rbind(genDichoMatrix(16, model = "2PL"),
             genDichoMatrix(6, model = "2PL", bPrior = c("norm", -1, 1)),
             genDichoMatrix(6, model = "2PL", bPrior = c("norm", 1, 1)),
             genDichoMatrix(9, model = "2PL", bPrior = c("norm", -2, 1)),
             genDichoMatrix(9, model = "2PL", bPrior = c("norm", 0, 1)),
             genDichoMatrix(9, model = "2PL", bPrior = c("norm", 2, 1)))
 it <- as.matrix(it)

 # Creation of the 'modules' matrix to list item membership in each module
 modules <- matrix(0, 55, 7)
 modules[1:8, 1] <- modules[9:16, 2] <- modules[17:22, 3] <- 1
 modules[23:28, 4] <- modules[29:37, 5] <- modules[38:46, 6] <- 1
 modules[47:55, 7] <- 1

 # Creation of the transition matrix to define a 1-2-3 MST
 trans <- matrix(0, 7, 7)
 trans[1, 3:4] <- trans[2, 3:4] <- trans[3, 5:7] <- trans[4, 5:7] <- 1

 # Creation of the start list: selection by MFI with ability level 0
 start <- list(theta = 0)

 # Creation of the test list: module selection by MFI, ability estimation by WL,
 # stepsize .4 adjustment for constant pattern
 test <- list(method = "WL", moduleSelect = "MFI", constantPatt = "fixed4")

 # Creation of the final list: ability estimation by ML
 final <- list(method = "ML")

 # Random MST generation for true ability level 1 and all ad-interim ability estimates
 res <- randomMST(trueTheta = 1, itemBank = it, modules = modules, transMatrix = trans,
                   start = start, test = test, final = final, allTheta = TRUE) 

 # Module selection by cut-scores for ability estimates
 # Creation of cut-off scores for ability levels: cut score 0 between modules 3 and 4
 # and cut scores -1 and 1 between modules 5, 6 and 7
 # randomesque selection with probability .8
 cut <- rbind(c(3, 4, 0), c(5, 6, -1), c(6, 7, 1))
 test <- list(method = "WL", constantPatt = "fixed4", cutoff = cut, randomesque = 0.8)
 res <- randomMST(trueTheta = 1, itemBank = it, modules = modules, transMatrix = trans,
                   start = start, test = test, final = final, allTheta = TRUE) 

 # Module selection by cut-scores for test scores
 # Creation of cut-off scores for test scores: cut score 4 between modules 3 and 4
 # and cut scores 5 and 9 between modules 5, 6 and 7
 cut.score <- rbind(c(3, 4, 4), c(5, 6, 5), c(6, 7, 9))
 test <- list(method = "score", cutoff = cut.score)
 final <- list(method = "score")
 res <- randomMST(trueTheta = 1, itemBank = it, modules = modules, transMatrix = trans,
                   start = start, test = test, final = final, allTheta = TRUE) 

 # Modification of cut-scores of stage 3 to use only the last module from stage 2 (6 items):
 # cut scores 2 and 4 between modules 5, 6 and 7
 cut.score2 <- rbind(c(3, 4, 4), c(5, 6, 2), c(6, 7, 4))
 test <- list(method = "score", cutoff = cut.score2, score.range = "last")
 final <- list(method = "score")
 res <- randomMST(trueTheta = 1, itemBank = it, modules = modules, transMatrix = trans,
                   start = start, test = test, final = final, allTheta = TRUE) 

 ## Plot options
 plot(trans)
 plot(res)
 plot(res, show.path = FALSE)
 plot(res, border.col = "blue")
 plot(res, arrow.col = "green")



