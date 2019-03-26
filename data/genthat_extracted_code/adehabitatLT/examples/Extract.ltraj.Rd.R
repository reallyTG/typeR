library(adehabitatLT)


### Name: Extract.ltraj
### Title: Extract or Replace Parts of an Object of Class ltraj
### Aliases: Extract.ltraj [.ltraj [<-.ltraj
### Keywords: spatial

### ** Examples

  data(puechcirc)
  puechcirc

  ## Extract the second and third bursts
  (toto <- puechcirc[2:3])

  ## Extracts all bursts collected on the animal JE
  puechcirc[id = "JE93"]

  
  ## Replace one burst
  toto[2] <- puechcirc[1]
  toto



