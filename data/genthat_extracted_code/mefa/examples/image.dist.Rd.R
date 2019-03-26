library(mefa)


### Name: image.dist
### Title: Image Plot of a 'dist' Object
### Aliases: image.dist
### Keywords: hplot ~kwd2

### ** Examples

data(dol.count, dol.samp)
m <- mefa(stcs(dol.count), dol.samp)
d <- dist(m$xtab)
g <- with(m$samp, interaction(microhab, method))
image(d)



