library(vocaldia)


### Name: anonymise
### Title: anonymise: anonymise a vocalisation diagram
### Aliases: anonymise anonymise.vocaldia anonymise.default

### ** Examples

data(vocdia)
x2 <- getSampledVocalMatrix(subset(atddia, id=='Abbott_Maddock_01'),
                            individual=TRUE, nodecolumn='speaker')
anonymise(x2)



