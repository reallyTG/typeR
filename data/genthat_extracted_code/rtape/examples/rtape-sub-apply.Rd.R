library(rtape)


### Name: rtape_apply
### Title: Iterate over tape, discarding results.
### Aliases: rtape_apply

### ** Examples
unlink('tmp.tape')
#Record something on the tape
rtapeAdd('tmp.tape',runif(3))
rtapeAdd('tmp.tape',rnorm(3))

#Print tape contents
rtape_apply('tmp.tape',print)
unlink('tmp.tape')


