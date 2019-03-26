library(SASxport)

data(iris)
write.xport(Iris1=iris[1:2,],
            empty=data.frame(),
            Iris2=iris[3:4,],
            file="testEmpty.xpt")

empty.s <- lookup.xport(file="testEmpty.xpt")
names(empty.s)
stopifnot( length(names(empty.s)) == 4 )

dat <- read.xport(file="testEmpty.xpt", verbose=TRUE)
stopifnot( length(names(dat)) == 3 )
stopifnot( nrow(dat)!=0 )
dat
