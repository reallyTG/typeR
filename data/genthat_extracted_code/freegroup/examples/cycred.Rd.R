library(freegroup)


### Name: cycred
### Title: Cyclic reductions of a word
### Aliases: cycred cyclic cyclically cyclically_reduced cyclically_reduce
###   cyclic_reduction is.cyclically.reduced is.cyclically.reduced2
###   as.cyclically_reduced is.cyclically_reduced is.cyclically_reduced2
###   cyclically_reduce_tietze is.conjugate_single is.conjugate
###   is.conjugate.free %~% %~%.onion allconj

### ** Examples


 as.cyclically_reduced(abc(1:9) - abc(9:1))

 a <- rfree(1000,3)
 all(size(as.cyclically_reduced(a)) <= size(a))
 all(total(as.cyclically_reduced(a)) <= total(a))
 all(number(as.cyclically_reduced(a)) <= number(a))



 x <- rfree(1000,2)
 y <- as.free('ab')
 table(conjugate = (x%~%y), equal = (x==y))  # note zero at top right

 allconj(as.free('aaaaab'))
 allconj(sum(abc(seq_len(3))))



 x <- rfree(1,10,8,8)
 all(is.id(allconj(x) + allconj(-x)[shift(rev(seq_len(total(x))))]))






