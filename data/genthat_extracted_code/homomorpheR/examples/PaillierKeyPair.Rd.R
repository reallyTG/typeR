library(homomorpheR)


### Name: PaillierKeyPair
### Title: Construct a Paillier public and private key pair given a fixed
###   number of bits
### Aliases: PaillierKeyPair
### Keywords: datasets

### ** Examples

keys <- PaillierKeyPair$new(1024)
keys$pubkey
keys$getPrivateKey()




