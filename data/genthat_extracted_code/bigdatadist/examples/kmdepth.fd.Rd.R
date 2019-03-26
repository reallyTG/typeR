library(bigdatadist)


### Name: kmdepth.fd
### Title: Kernel Mahalanobis Depth for Functional Data
### Aliases: kmdepth.fd
### Keywords: Kernel depth

### ** Examples

data(Ausmale); t <- Ausmale[[1]]
t = as.numeric(( t - min(t) ) / length(t))
raw.data = fdframe(t=t, Y=Ausmale[[2]])

kmd.fit.fd = kmdepth.fd(raw.data, gamma = 0.0001, kerfunc = "rbf" ,
                        kerpar = list(sigma = 10) , d = 2 , robust=TRUE)  

kmd.fit.fd$depth

rbPal <- colorRampPalette(c('red','black'))
color = rbPal(5)[as.numeric(cut(kmd.fit.fd$depth,breaks = 5))]
plot(rkhs(raw.data,gamma=0.0001,kerfunc="rbf",kerpar=list(sigma = 10)),
 col = color, xlab='time',ylab='')



