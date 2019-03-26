library(rtape)


### Name: rtapeLapply
### Title: Iterate over tape, gathering results.
### Aliases: rtapeLapply

### ** Examples
unlink('tmp.tape')
#Record something on the tape
rtapeAdd('tmp.tape',runif(3))
rtapeAdd('tmp.tape',rnorm(3))

#Print tape contents
rtape_apply('tmp.tape',print)
unlink('tmp.tape')


