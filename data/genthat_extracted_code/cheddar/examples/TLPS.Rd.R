library(cheddar)


### Name: TLPS
### Title: Trophic-link properties
### Aliases: TLPS
### Keywords: utilities

### ** Examples

data(TL84)

# Just resource and consumer
head(TLPS(TL84))

# resource, consumer, resource.M and consumer.M
head(TLPS(TL84, node.properties='M'))

# Log10RCMRatio returns log10-transformed resource.M / consumer.M
head(TLPS(TL84, node.properties='M', link.properties='Log10RCMRatio'))

# Skipwith Pond has link.evidence and link.life.stage first-class properties
data(SkipwithPond)
head(TLPS(SkipwithPond))

# resource, consumer and link.evidence
head(TLPS(SkipwithPond, link.properties='link.evidence'))

# Skipwith Pond has diet.fraction first-class property
data(Benguela)
head(TLPS(Benguela))



