library(SDEFSR)


### Name: SDIGA
### Title: Subgroup Discovery Iterative Genetic Algorithm (SDIGA)
### Aliases: SDIGA

### ** Examples

SDIGA(parameters_file = NULL, 
      training = habermanTra, 
      test = habermanTst, 
      output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
      seed = 0, 
      nLabels = 3,
      nEval = 300, 
      popLength = 100, 
      mutProb = 0.01, 
      RulesRep = "can",
      Obj1 = "CSUP", 
      w1 = 0.7,
      Obj2 = "CCNF",
      w2 = 0.3,
      Obj3 = "null",
      w3 = 0,
      minConf = 0.6,
      lSearch = "yes",
      targetClass = "positive")
## Not run: 
##D SDIGA(parameters_file = NULL, 
##D       training = habermanTra, 
##D       test = habermanTst, 
##D       output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
##D       seed = 0, 
##D       nLabels = 3,
##D       nEval = 300, 
##D       popLength = 100, 
##D       mutProb = 0.01, 
##D       RulesRep = "can",
##D       Obj1 = "CSUP", 
##D       w1 = 0.7,
##D       Obj2 = "CCNF",
##D       w2 = 0.3,
##D       Obj3 = "null",
##D       w3 = 0,
##D       minConf = 0.6,
##D       lSearch = "yes",
##D       targetClass = "positive")
##D       
## End(Not run)



