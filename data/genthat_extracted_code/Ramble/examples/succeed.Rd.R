library(Ramble)


### Name: succeed
### Title: 'succeed' is based on the empty string symbol in the BNF
###   notation The 'succeed' parser always succeeds, without actually
###   consuming any input string. Since the outcome of succeed does not
###   depend on its input, its result value must be pre-detemined, so it is
###   included as an extra parameter.
### Aliases: succeed

### ** Examples

succeed("1") ("abc")



