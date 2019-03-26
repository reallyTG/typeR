library(TSclust)


### Name: diss.CDM
### Title: Compression-based Dissimilarity measure
### Aliases: diss.CDM
### Keywords: ~kwd1 ~kwd2

### ** Examples

n = 50
x <- rnorm(n)  #generate sample series, white noise and a wiener process
y <- cumsum(rnorm(n))

diss.CDM(x, y)

z <- rnorm(n)
w <- cumsum(rnorm(n))
series = rbind(x, y, z, w)
diss(series, "CDM", type="bzip2")

################################################################
#####symbolic representation prior to compression, using SAX####
####simpler symbolization, such as round() could also be used###
################################################################
#normalization function, required for SAX
z.normalize = function(x) {
    (x - mean(x)) / sd(x)
}

sx <- convert.to.SAX.symbol( z.normalize(x), alpha=4 )
sy <- convert.to.SAX.symbol( z.normalize(y), alpha=4 )
sz <- convert.to.SAX.symbol( z.normalize(z), alpha=4 )
sw <- convert.to.SAX.symbol( z.normalize(w), alpha=4 )

diss(rbind(sx, sy, sz, sw), "CDM", type="bzip2")



