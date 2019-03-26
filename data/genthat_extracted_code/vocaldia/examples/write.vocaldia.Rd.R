library(vocaldia)


### Name: write.vocaldia
### Title: write.vocaldia
### Aliases: write.vocaldia

### ** Examples

data(vocdia)
write.vocaldia(getSampledVocalMatrix(subset(atddia,
                                            id=='Abbott_Maddock_01'),
                       individual=TRUE, nodecolumn='speaker'),
                       file=tempfile(pattern='vocaldia-', fileext='.dot'))



