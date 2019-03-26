library(caesar)


### Name: seed_cipher
### Title: Encrypt and Decrypt text using pseduorandom number generation
### Aliases: seed_cipher

### ** Examples

seed_cipher("cats are friends!")
seed_cipher("bc204c5d495ud?:08", reverse = TRUE)


seed_cipher("cats are friends!", seed = 2354)
seed_cipher("li%1sid3szdp3 j1g", seed = 2354, reverse = TRUE)

seed_cipher("cats are #1 friend!", seed = -100)
seed_cipher("hd2imdjpmfm-jcpe&q", seed = -100, reverse = TRUE)



