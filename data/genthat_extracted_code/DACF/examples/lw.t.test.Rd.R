library(DACF)


### Name: lw.t.test
### Title: lw.t.test
### Aliases: lw.t.test

### ** Examples

x1.c=induce.cfe(0,.3,rnorm(1000,20,5)) #group 1 scores with 30% ceiling data
x2.c=induce.cfe(.15,0,rnorm(1000,30,5)) #group 2 scores with 15% floor data
lw.t.test(x1.c,x2.c,"a") #using truncated n
lw.t.test(x1.c,x2.c,"b") #using original n



