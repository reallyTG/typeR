library(rbtc)


### Name: Wif2PrivKey
### Title: Create private key from WIF
### Aliases: Wif2PrivKey

### ** Examples

pk1 <- createPrivateKey()
wif <- PrivKey2Wif(pk1)
pk2 <- Wif2PrivKey(wif)
identical(pk1, pk2)



