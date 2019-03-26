library(tensorA)


### Name: sequencing
### Title: Working with index sequences
### Aliases: $.tensor ^.tensor |.tensor renamefirst.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:20,c(i=5,j=2,k=2))
C <- to.tensor(1:4,c(i=2,j=2))
E <- A$ihl %e% C$hj %e% C$lk |"$ijk"
E
# Same as:
E2 <- reorder.tensor(A[[j=~h,k=~l]] %e% C[[i=~h]] %e% C[[i=~l,j=~k]],c("i","j","k"))
E-E2
E <- A$i.h.l %e% C$h.j %e% C$l.k |"i.j.k"
E
E-E2
E <- A^"i.h.l" %e% C^"h.j" %e% C^"l.k" |"i.j.k"
E
E-E2



