library(randtests)


### Name: difference.sign.test
### Title: Difference Sign Test
### Aliases: difference.sign.test
### Keywords: randomness test

### ** Examples

##
## Example 1
## Annual Canadian Lynx trappings 1821-1934 in Canada.
## Available in datasets package
##
## Not run: plot(lynx)
difference.sign.test(lynx)

##
## Example 2
## Sweet potato production, harvested in the United States, between 1868 and 1937.
## Available in this package.
##
data(sweetpotato)
difference.sign.test(sweetpotato$production)



