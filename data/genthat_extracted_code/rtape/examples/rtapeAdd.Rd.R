library(rtape)


### Name: rtapeAdd
### Title: Add object to the tape.
### Aliases: rtapeAdd

### ** Examples
unlink('tmp.tape')
#Record something on the tape
rtapeAdd('tmp.tape',iris)
rtapeAdd('tmp.tape',sin(1:10))
#Read whole tape to the list, so we could examine it
rtapeAsList('tmp.tape')->stored
print(stored)
unlink('tmp.tape')


