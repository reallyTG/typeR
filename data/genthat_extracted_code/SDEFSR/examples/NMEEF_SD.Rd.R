library(SDEFSR)


### Name: NMEEF_SD
### Title: Non-dominated Multi-objective Evolutionary algorithm for
###   Extracting Fuzzy rules in Subgroup Discovery (NMEEF-SD)
### Aliases: NMEEF_SD

### ** Examples

 
   NMEEF_SD(paramFile = NULL, 
               training = habermanTra, 
               test = habermanTst, 
               output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
               seed = 0, 
               nLabels = 3,
               nEval = 300, 
               popLength = 100, 
               mutProb = 0.1,
               crossProb = 0.6,
               Obj1 = "CSUP",
               Obj2 = "CCNF",
               Obj3 = "null",
               minCnf = 0.6,
               reInitCoverage = "yes",
               porcCob = 0.5,
               StrictDominance = "yes",
               targetClass = "positive"
               )  
## Not run: 
##D       NMEEF_SD(paramFile = NULL, 
##D                training = habermanTra, 
##D                test = habermanTst, 
##D                output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
##D                seed = 0, 
##D                nLabels = 3,
##D                nEval = 300, 
##D                popLength = 100, 
##D                mutProb = 0.1,
##D                crossProb = 0.6,
##D                Obj1 = "CSUP",
##D                Obj2 = "CCNF",
##D                Obj3 = "null",
##D                minCnf = 0.6,
##D                reInitCoverage = "yes",
##D                porcCob = 0.5,
##D                StrictDominance = "yes",
##D                targetClass = "null"
##D                )
##D      
## End(Not run)



