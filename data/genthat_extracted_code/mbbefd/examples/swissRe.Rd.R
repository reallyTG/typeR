library(mbbefd)


### Name: swissRe
### Title: Swiss Re exposure curve generation function
### Aliases: swissRe

### ** Examples

pars <- swissRe(4)
losses <- rMBBEFD(n=1000,b=pars[1],g=pars[2])
mean(losses)



