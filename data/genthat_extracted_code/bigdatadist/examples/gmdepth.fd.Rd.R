library(bigdatadist)


### Name: gmdepth.fd
### Title: Generalized Mahalanobis Kernel Depth and Distance for Functional
###   Data
### Aliases: gmdepth.fd
### Keywords: Kernel depth

### ** Examples

data(Ausmale); t <- Ausmale[[1]]
t = as.numeric(( t - min(t) ) / length(t))
raw.data = fdframe(t=t, Y=Ausmale[[2]])

gmd.fit.fd = gmdepth.fd(raw.data,gamma=0.001,
            kerfunc="rbf",kerpar=list(sigma = 10))

gmd.fit.fd$distance
gmd.fit.fd$depth

rbPal <- colorRampPalette(c('red','black'))
color = rbPal(5)[as.numeric(cut(gmd.fit.fd$depth,breaks = 5))]
plot(rkhs(raw.data,gamma=0.0001,kerfunc="rbf",kerpar=list(sigma = 10)),
 col = color, xlab='time',ylab='')



