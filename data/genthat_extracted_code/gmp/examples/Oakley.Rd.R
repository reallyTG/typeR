library(gmp)


### Name: Oakley
### Title: RFC 2409 Oakley Groups - Parameters for Diffie-Hellman Key
###   Exchange
### Aliases: Oakley Oakley1 Oakley2
### Keywords: data

### ** Examples

packageDescription("gmp") # {possibly useful for debugging}

data(Oakley1)
(M1 <- modulus(Oakley1))
isprime(M1)# '1' : "probably prime"
sizeinbase(M1)#  232 digits (was 309 in older version)



