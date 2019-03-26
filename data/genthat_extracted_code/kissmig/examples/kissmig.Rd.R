library(kissmig)


### Name: kissmig
### Title: Run a simple species migration model
### Aliases: kissmig

### ** Examples

## No test: 
library(kissmig)

s <- kissmigDummyS(mean=12,sd=3, download=TRUE) # a suitability map
o <- kissmigOrigin(s, 8, 44.5, 0.5)             # geographic origin
l <- s>=0                                       # land mask
plot(s+o, asp=1.0, main='suitability + origin')

# run kissmig with different type of output

k <- kissmig(o, s, it=150, type='DIS')
plot(k*l, asp=1.0, main='final distribution')

k <- kissmig(o, s, it=150, type='FOC')
plot(k*l, asp=1.0, main='first iteration step of occurrence')

a <- kissmigAccess(k)
plot(a*l, asp=1.0, main='accessibility based on "FOC", absolute values')

a <- kissmigAccess(k, rel=TRUE)
plot(a*l, asp=1.0, main='accessibility based on "FOC", relative values')

k <- kissmig(o, s, it=150, type='LOC')
plot(k*l, asp=1.0, main='last iteration step of occurrence')

k <- kissmig(o, s, it=150, type='NOC')
plot(k*l, asp=1.0, main='number of iteration steps with occurrences')
## End(No test)



