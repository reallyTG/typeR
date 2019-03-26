library(move)


### Name: citations
### Title: Extract the citation of a Move or MoveStack object
### Aliases: citations citations<- citations,.MoveGeneral-method
###   citations<-,.MoveGeneral-method

### ** Examples

  data(leroy)
  citations(leroy) #get the citation from a Move object
  citations(leroy) <- "No paper available" #change the citation and set it for a Move object
 
  data(fishers)
  citations(fishers) #get the citation from a MoveStack object
  citations(fishers) <- "Nothing to cite" #change the citation and set it for a MoveStack object



