library(nadiv)


### Name: makeDomEpi
### Title: Creates the additive by dominance and dominance by dominance
###   epistatic genetic relationship matrices
### Aliases: makeDomEpi

### ** Examples


  Boutput <- makeDomEpi(Mrode9, output = "b", parallel = FALSE, invertD = FALSE)
  str(Boutput)
	
  DADoutput <- makeDomEpi(Mrode9, output = "AD", parallel = FALSE, invertD = TRUE)
  str(DADoutput)




