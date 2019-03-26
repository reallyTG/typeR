library(SDEFSR)


### Name: MESDIF
### Title: Multiobjective Evolutionary Subgroup DIscovery Fuzzy rules
###   (MESDIF) Algorithm
### Aliases: MESDIF

### ** Examples

 MESDIF( paramFile = NULL,
        training = habermanTra, 
        test = habermanTst, 
        output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
        seed = 0, 
        nLabels = 3,
        nEval = 300, 
        popLength = 100, 
        eliteLength = 3,
        crossProb = 0.6,
        mutProb = 0.01, 
        RulesRep = "can",
        Obj1 = "CSUP", 
        Obj2 = "CCNF",
        Obj3 = "null",
        Obj4 = "null",
        targetClass = "positive"
        )

## Not run: 
##D Execution for all classes, see 'targetClass' parameter
##D MESDIF( paramFile = NULL,
##D         training = habermanTra, 
##D         test = habermanTst, 
##D         output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
##D         seed = 0, 
##D         nLabels = 3,
##D         nEval = 300, 
##D         popLength = 100, 
##D         eliteLength = 3,
##D         crossProb = 0.6,
##D         mutProb = 0.01, 
##D         RulesRep = "can",
##D         Obj1 = "CSUP", 
##D         Obj2 = "CCNF",
##D         Obj3 = "null",
##D         Obj4 = "null",
##D         targetClass = "null"
##D         )
##D  
## End(Not run)




