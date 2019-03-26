library(cheddar)


### Name: NvMTriTrophicStatistics
### Title: N-versus-M tri-trophic statistics
### Aliases: NvMTriTrophicStatistics
### Keywords: utilities

### ** Examples

data(TL84)
tts <- NvMTriTrophicStatistics(TL84)
nrow(tts$links)
head(tts$links)

nrow(tts$three.node.chains)
head(tts$three.node.chains)

nrow(tts$trophic.chains)
head(tts$trophic.chains)



