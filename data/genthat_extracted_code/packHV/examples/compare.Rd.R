library(packHV)


### Name: compare
### Title: Comparing two databases assumed to be identical
### Aliases: compare

### ** Examples

N=100
data1=data.frame(id=1:N,a=rnorm(N),
                        b=factor(sample(LETTERS[1:5],N,TRUE)),
                        c=as.character(sample(LETTERS[1:5],N,TRUE)),
                        d=as.Date(32768:(32768+N-1),origin="1900-01-01"))
data1$c=as.character(data1$c)
data2=data1
data2$id[3]=4654
data2$a[30]=NA
data2$a[31]=45
data2$b=as.character(data2$b)
data2$d=as.character(data2$d)
data2$e=rnorm(N)
compare(data1,data2,"id")



