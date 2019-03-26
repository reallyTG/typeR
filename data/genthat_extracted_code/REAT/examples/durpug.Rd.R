library(REAT)


### Name: durpug
### Title: Relative diversity index by Duranton and Puga
### Aliases: durpug

### ** Examples

# Example Goettingen:

data(Goettingen)
# Loads the data

durpug (Goettingen$Goettingen2008[2:13], Goettingen$BRD2008[2:13])
# Returns the Duranton-Puga RDI for Goettingen



