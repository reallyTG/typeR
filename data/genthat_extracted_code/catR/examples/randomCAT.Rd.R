library(catR)


### Name: randomCAT
### Title: Random generation of adaptive tests (dichotomous and polytomous
###   models)
### Aliases: randomCAT print.cat plot.cat

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Matrix of item parameters (with no content balancing)
 bank <- as.matrix(tcals[,1:4])
 
 # Creation of a starting list: 5 items with evenly spread theta values
 start <- list(theta = -2:2)

 # Creation of 'test' list: weighted likelihood estimation of provisional ability, 
 # and MFI criterion for next item selection
 test <- list(method = "WL", itemSelect = "MFI")

 # Creation of 'final' list: EAP estimation of final ability
 final <- list(method = "EAP")

 # Creation of a stopping rule: precision criterion, standard error to be reached 0.3
 stop <- list(rule = "precision", thr = 0.3)

 # CAT test
 res <- randomCAT(0, bank, start = start, test = test, stop = stop, final = final)

## No test: 
 # Update of the stopping rule: by adding a length criterion, with threshold of 10 items
 stop <- list(rule = c("precision", "length"), thr = c(0.3, 10))

 # CAT test
 res <- randomCAT(0, bank, start = start, test = test, stop = stop, final = final)

 # Modifying 'start', 'test' and 'final' lists to compute exact SEs
 start.exact <- list(theta = c(-1, 1))
 test.exact <- list(method = "WL", itemSelect = "MFI", sem.exact = TRUE)
 final.exact <- list(method = "WL", sem.exact = TRUE)
 res.exact <- randomCAT(0, bank, start = start.exact, test = test.exact, 
                        stop = stop, final = final.exact)

 # Creation of a (purely artificial) response pattern for post-hoc simulation
 resp <- rbinom(nrow(bank), 1, 0.5)
 res.ph <- randomCAT(0, bank, start = start, test = test, stop = stop, final = final,
        responses = resp)

 # New 'test' and 'final' rules (BM and EAP estimation with Jeffreys' prior, 
 # randomesque value 5)
 test2 <- list(method = "BM", priorDist = "Jeffreys", randomesque = 5)
 final2 <- list(method = "EAP", priorDist = "Jeffreys")

 # New stopping rule: classification criterion, with classification threshold 0 and 
 # alpha level 0.05
 stop2 <- list(rule = "classification", thr = 0, alpha = 0.05)

 # CAT test with new 'test', 'stop' and 'final' rules
 res2 <- randomCAT(0, bank, start = start, test = test2, stop = stop2, final = final2)

 # New stopping rule: classification criterion, with classification threshold 0.5
 # and alpha level 0.05
 stop3 <- list(rule = "classification", thr = 0.5, alpha = 0.05)

 # CAT test with new 'stop' rule
 res3 <- randomCAT(0, bank, start = start, test = test2, stop = stop3, final=final2)

 # new 'test' and 'stop' rule for next item selection
 test3 <- list(method = "WL", itemSelect = "MLWI")
 stop4 <- list(rule = "length",thr = 10)
 res4 <- randomCAT(0, bank, start = start, test = test3, stop = stop4, final = final2)

 # Creation of the 'cbList' list with arbitrary proportions
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2",
        "Written3"), props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 # CAT test with 'start', 'test', 'stop4' and 'final2' lists and content balancing 
 # using 'cbList' ('tcals' must be used now for content balancing)
 stop4 <- list(rule = "length",thr = 10)
 res5 <- randomCAT(0, tcals, start = start, test = test, stop = stop4, final = final2, 
      cbControl = cbList)

 # new 'start' list to force content balancing control at the starting step
 start2 <- list(seed = 1, nrItems = 3, cb.control = TRUE)
 res6 <- randomCAT(0, tcals, start = start2, test = test, stop = stop4, final = final2, 
      cbControl = cbList)

 # Using progressive item selection rule and requiring all ability estimates and SEs
 test4 <- list(itemSelect = "progressive")
 res6 <- randomCAT(0, tcals, start = start, test = test4, stop = stop4, final = final, 
      cbControl = cbList, allTheta = TRUE)

 # Plotting results
 plot(res)
 plot(res, ci = TRUE)
 plot(res, ci = TRUE, trueTh = FALSE)
 plot(res, ci = TRUE, classThr = 1)

 # With mistake
 plot(res, ci = 0.05)
 plot(res, classThr = TRUE)


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # CAT options
 start <- list(theta = c(-1, 0),startSelect = "MFI")
 test <- list(method = "BM", itemSelect = "KL")
 stop <- list(rule = "precision", thr = 0.4)
 final <- list(method = "EAP")

 # CAT test
 res <- randomCAT(0, m.GRM,model = "GRM", start = start, test = test, stop = stop,
 	final = final)
 res


 # Creation of an appropriate list for content balancing
 # Equal proprotions across subgroups of items
 cbList <- list(names = c("Group1", "Group2", "Group3", "Group4"), props = rep(1,4))

 # With content balancing, all ability estimates and progressive method
 m.GRM <- genPolyMatrix(100, 4, "GRM", cbControl = cbList)
 test <- list(method = "BM", itemSelect = "progressive")
 res <- randomCAT(0, m.GRM, model = "GRM", start = start, test = test, stop = stop, 
 	final = final, cbControl = cbList, allTheta = TRUE)
 res

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 stop <- list(rule = "length", thr = 10)
 res <- randomCAT(0, cat_pav, model = "GPCM", start = start, test = test, stop = stop, 
 	final = final, allTheta = TRUE)
 res
 
## End(No test)



