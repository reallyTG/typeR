library(REAT)


### Name: krugman.spec
### Title: Krugman coefficient of regional specialization for two regions
### Aliases: krugman.spec

### ** Examples

# Example from Farhauer/Kroell (2013), modified:
E_ij <- c(20,10,70,0,0)
# employment of five industries in region j
E_il <- c(0,0,0,60,40)
# employment of five industries in region l
krugman.spec(E_ij, E_il)
# results the specialization coefficient (2)

# Example Goettingen:
data(Goettingen)
krugman.spec(Goettingen$Goettingen2017[2:16], Goettingen$BRD2017[2:16])
# Returns the Krugman coefficient of regional specialization 2017 (0.4508469)



