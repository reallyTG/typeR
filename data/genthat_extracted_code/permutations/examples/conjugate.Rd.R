library(permutations)


### Name: conjugate
### Title: Are two permutations conjugate?
### Aliases: are_conjugate are_conjugate are_conjugate_single

### ** Examples


are_conjugate(rperm(20,3),rperm(20,3))



z <- rperm(300,4)
stopifnot(all(are_conjugate(z,id)==is.id(z)))

data(megaminx)
stopifnot(all(are_conjugate(megaminx,megaminx^as.cycle(sample(129)))))



