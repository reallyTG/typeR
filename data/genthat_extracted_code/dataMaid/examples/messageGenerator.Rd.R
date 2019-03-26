library(dataMaid)


### Name: messageGenerator
### Title: Produce a message for the output of a checkFunction
### Aliases: messageGenerator

### ** Examples


#Varibales with/without underscores
 noUSVar <- c(1:10)
 USVar <- c("_a", "n_b", "b_", "_", 1:10)

#Define a checkFunction using messageGenerator with a manual
#problem description:
identifyUnderscores <- function(v, nMax = Inf) {
  v <- as.character(v)
  underscorePlaces <- regexpr("_", v) > 0
  problemValues <- unique(v[underscorePlaces])
  problem <- any(underscorePlaces)
  message <- messageGenerator(list(problemValues = problemValues, problem = problem),
                              "The following values contain underscores:",
                              nMax = nMax)
  checkResult(list(problem = problem, message = message,
      problemValues = problemValues))
 }

 identifyUnderscores(noUSVar) #no problem
 identifyUnderscores(USVar) #problems
 
#Only print the first two problemvalues in the message:
 identifyUnderscores(USVar, nMax = 2)

#Define same function, but without a manual problem description in
#the messageGenerator-call:
 identifyUnderscores2 <- function(v, nMax = Inf) {
  v <- as.character(v)
  underscorePlaces <- regexpr("_", v) > 0
  problemValues <- unique(v[underscorePlaces])
  problem <- any(underscorePlaces)
  message <- messageGenerator(list(problemValues = problemValues,
                                   problem = problem), nMax = nMax)
  checkResult(list(problem = problem, message = message,
      problemValues = problemValues))
 }

 identifyUnderscores2(noUSVar) #no problem
 identifyUnderscores2(USVar) #problems




