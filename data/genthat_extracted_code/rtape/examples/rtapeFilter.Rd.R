library(rtape)


### Name: rtapeFilter
### Title: Rerecord the tape dropping certain objects.
### Aliases: rtapeFilter

### ** Examples
unlink(c('tmp.tape'))
#Record something
for(i in 1:10) rtapeAdd('tmp.tape',i)

#Discard even numbers
rtapeFilter(function(x) (x%%2)==1,'tmp.tape')

#Check it out
unlist(rtapeAsList('tmp.tape'))->A
print(A);
stopifnot(all(A==c(1,3,5,7,9)))

#Time to clean up
unlink(c('tmp.tape'))


