library(SemNetCleaner)


### Name: equate
### Title: Equate Group Responses
### Aliases: equate

### ** Examples

#finalize rmatA
finalCmat <- finalize(convmat)

#finalize rmatB
finalRmat <- finalize(rmat)

#equate rmatA and rmatB
eq1 <- equate(finalCmat,finalRmat)

#obtain respective equated response matrices
eqCmat <- eq1$rmatA
eqRmat <- eq1$rmatB




