library(samon)


### Name: samoneval
### Title: Evaluates the loss function on a range of sigmas
### Aliases: samoneval

### ** Examples

data("samonPANSS1")
## dropout loss function
H1 <- samoneval( mat = samonPANSS1, Npart = 5,
      sigmaList      = seq(1,10,by=1),          
      type           = "H" )



