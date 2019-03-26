library(corpora)


### Name: corpora.palette
### Title: Colour palettes for linguistic visualization (corpora)
### Aliases: corpora.palette alpha.col
### Keywords: color

### ** Examples

par.save <- par(mfrow=c(2, 2))
for (name in qw("seaborn muted bright simple")) {
  barplot(rep(1, 10), col=corpora.palette(name, 10), main=name)
}
par(par.save)



