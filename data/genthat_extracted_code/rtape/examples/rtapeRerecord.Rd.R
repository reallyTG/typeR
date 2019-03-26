library(rtape)


### Name: rtapeRerecord
### Title: Rerecord the tape.
### Aliases: rtapeRerecord

### ** Examples
unlink(c('tmp.tape','tmp2.tape'))
#Record something
for(i in 1:10) rtapeAdd('tmp.tape',i)

#Multiply each object by two
rtapeRerecord('*','tmp.tape','tmp2.tape',moreArgs=list(2))

#Check it out
unlist(rtapeAsList('tmp.tape'))->A
B<-unlist(rtapeAsList('tmp2.tape'))
print(A);print(B)
stopifnot(all(A==B/2))

#Now do the same in-place:
rtapeRerecord('*','tmp.tape',moreArgs=list(2))
unlist(rtapeAsList('tmp.tape'))->B2
stopifnot(all(A==B2/2))

#Time to clean up
unlink(c('tmp.tape','tmp2.tape'))


