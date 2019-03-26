library(soundgen)


### Name: logMatrix
### Title: Log-warp matrix
### Aliases: logMatrix
### Keywords: internal

### ** Examples

m = matrix(1:90, nrow = 10)
soundgen:::logMatrix(m, base = 2)
soundgen:::logMatrix(m, base = 10)

soundgen:::logMatrix(m = matrix(1:9, nrow = 1), base = 2)

## Not run: 
##D s = spectrogram(soundgen(), 16000, output = 'original')
##D image(log(t(soundgen:::logMatrix(s, base = 2))))
## End(Not run)



