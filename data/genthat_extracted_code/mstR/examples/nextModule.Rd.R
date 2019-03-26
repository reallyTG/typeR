library(mstR)


### Name: nextModule
### Title: Selection of the next module in MST
### Aliases: nextModule

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

 # Module 1 previously administered, provisional ability 0, MFI criterion
 nextModule(it, modules, trans, current.module = 1, out = 1:8)

 # Generation of item responses for module 1
 x <- genPattern(0, it[1:8,])

 # MLWMI criterion 
 nextModule(it, modules, trans, current.module = 1, out = 1:8, x = x, criterion = "MLWMI")

 # MPWMI criterion
 nextModule(it, modules, trans, current.module = 1, out = 1:8, x = x, criterion = "MPWMI")

 # MKL criterion
 nextModule(it, modules, trans, current.module = 1, out = 1:8, x = x, criterion = "MKL")

 # MKLP criterion
 nextModule(it, modules, trans, current.module = 1, out = 1:8, x = x, criterion = "MKLP")

 # Creation of cut-off scores for ability levels: cut score 0 between modules 3 and 4
 # and cut scores -1 and 1 between modules 5, 6 and 7
 cut <- rbind(c(3, 4, 0), c(5, 6, -1), c(6, 7, 1))

 # Selection by cut-off score, module 1 previously administered, current ability level 0 
 # (=> module 4 is chosen)
 nextModule(it, modules, trans, current.module = 1, out = 1:8, cutoff = cut, theta = 0)

 # Same with current ability level -0.5 (=> module 3 is chosen)
 nextModule(it, modules, trans, current.module = 1, out = 1:8, cutoff = cut, theta = -0.5)

 # Modules 1 and 3 previously administered, current ability level 0 (=> module 6 is chosen)
 nextModule(it, modules, trans, current.module = 3, out = c(1:8, 17:22), cutoff = cut,  
           theta = 0)

 # Same with current ability level 2 (=> module 7 is chosen)
 nextModule(it, modules, trans, current.module = 3, out = c(1:8, 17:22), cutoff = cut, 
           theta = 2)

 # Ranomesque probability 0.5 and random.seed value 2 (=> module 6 is chosen)
 nextModule(it, modules, trans, current.module = 3, out = c(1:8, 17:22), cutoff = cut, 
           theta = 2, randomesque = 0.5, random.seed = 2)

 # Creation of cut-off scores for test scores: cut score 4 between modules 3 and 4
 # and cut scores 5 and 9 between modules 5, 6 and 7
 cut.score <- rbind(c(3, 4, 4), c(5, 6, 5), c(6, 7, 9))

 # Module 1 previously administered, current test score 1 (=> module 3 is chosen)
 nextModule(it, modules, trans, current.module = 1, out = 1:8, cutoff = cut.score, 
           theta = 1)

 # Modules 1 and 3 previously administered, current tes score 6 (=> module 6 is chosen)
 nextModule(it, modules, trans, current.module = 3, out = c(1:8, 17:22), cutoff = cut.score, 
           theta = 6)


## Polytomous models ##

 # Same structure as above but parameters are now generated from PCM with at most
 # 4 categories
 it.pol <- genPolyMatrix(55, model = "PCM", nrCat = 4)
 it.pol <- as.matrix(it)

 # Module 1 previously administered, provisional ability 0, MFI criterion
 nextModule(it.pol, modules, trans, model = "PCM", current.module = 1, out = 1:8)

 # MLWMI criterion 
 nextModule(it.pol, modules, trans, model = "PCM", current.module = 1, out = 1:8, x = x, 
           criterion = "MLWMI")

# MKL criterion 
 nextModule(it.pol, modules, trans, model = "PCM", current.module = 1, out = 1:8, x = x, 
           criterion = "MKL")

# MKLP criterion 
 nextModule(it.pol, modules, trans, model = "PCM", current.module = 1, out = 1:8, x = x, 
           criterion = "MKLP")

# Selection by cut-off score, module 1 previously administered, current ability level 0 
 # (=> module 4 is chosen)
 nextModule(it.pol, modules, trans, model = "PCM", current.module = 1, out = 1:8, 
           cutoff = cut, theta = 0)
  


