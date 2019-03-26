library(bigdatadist)


### Name: rkhs
### Title: RKHS Representation
### Aliases: rkhs
### Keywords: rkhs

### ** Examples

data(merval); t <- as.Date(merval[1:100,1])
t <- as.numeric(( t - min(t) ) / 154)
raw.data <-fdframe(t = t, Y = merval[1:100,2:5])
plot(raw.data, xlab='time', ylab='Merval raw data')

f.data <- rkhs(raw.data, gamma = 0.001, kerpar = list(sigma = 8))

print(f.data)

plot(f.data, xlab='time', ylab='Merval data')




