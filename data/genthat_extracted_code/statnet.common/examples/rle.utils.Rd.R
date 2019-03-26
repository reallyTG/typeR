library(statnet.common)


### Name: rle.utils
### Title: RLE utilities
### Aliases: rle.utils c.rle !.rle binop.rle |.rle &.rle compact.rle
###   any.rle all.rle *.rle /.rle -.rle +.rle ^.rle %%.rle %/%.rle ==.rle
###   >.rle <.rle !=.rle <=.rle >=.rle sum.rle mean.rle length.rle
###   is.na.rle rep.rle

### ** Examples


x <- rle(as.logical(rbinom(10,1,.7)))
y <- rle(as.logical(rbinom(10,1,.3)))

stopifnot(isTRUE(all.equal(c(inverse.rle(x),inverse.rle(y)),inverse.rle(c(x,y)))))

stopifnot(isTRUE(all.equal((!inverse.rle(x)),inverse.rle(!x))))
stopifnot(isTRUE(all.equal((inverse.rle(x)|inverse.rle(y)),inverse.rle(x|y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)&inverse.rle(y)),inverse.rle(x&y))))
stopifnot(identical(rle(inverse.rle(x)&inverse.rle(y)),compact.rle(x&y)))

big <- structure(list(lengths=as.integer(rep(.Machine$integer.max/4,6)),
                      values=rep(TRUE,6)), class="rle")

stopifnot(all(aggregate(as.numeric(lengths)~values,
                        data=as.data.frame(unclass(big)),FUN=sum)
              ==
              aggregate(as.numeric(lengths)~values,
                        data=as.data.frame(unclass(compact.rle(big))),
                        FUN=sum)))

x <- rle(as.logical(rbinom(10,1,.9)))
y <- rle(as.logical(rbinom(10,1,.1)))

stopifnot(isTRUE(all.equal(any(x),any(inverse.rle(x)))))
stopifnot(isTRUE(all.equal(any(y),any(inverse.rle(y)))))


stopifnot(isTRUE(all.equal(all(x),all(inverse.rle(x)))))
stopifnot(isTRUE(all.equal(all(y),all(inverse.rle(y)))))


x <- rle(sample(c(-1,+1), 10, c(.7,.3), replace=TRUE))
y <- rle(sample(c(-1,+1), 10, c(.3,.7), replace=TRUE))

stopifnot(isTRUE(all.equal((inverse.rle(x)*inverse.rle(y)),inverse.rle(x*y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)/inverse.rle(y)),inverse.rle(x/y))))
stopifnot(isTRUE(all.equal((-inverse.rle(y)),inverse.rle(-y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)-inverse.rle(y)),inverse.rle(x-y))))
stopifnot(isTRUE(all.equal((+inverse.rle(y)),inverse.rle(+y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)+inverse.rle(y)),inverse.rle(x+y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)^inverse.rle(y)),inverse.rle(x^y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)%%inverse.rle(y)),inverse.rle(x%%y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)%/%inverse.rle(y)),inverse.rle(x%/%y))))
stopifnot(isTRUE(all.equal(inverse.rle(x)==inverse.rle(y),inverse.rle(x==y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)>inverse.rle(y)),inverse.rle(x>y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)<inverse.rle(y)),inverse.rle(x<y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)!=inverse.rle(y)),inverse.rle(x!=y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)<=inverse.rle(y)),inverse.rle(x<=y))))
stopifnot(isTRUE(all.equal((inverse.rle(x)>=inverse.rle(y)),inverse.rle(x>=y))))

stopifnot(isTRUE(all.equal(sum(inverse.rle(x)),sum(x))))
stopifnot(isTRUE(all.equal(sum(inverse.rle(y)),sum(y))))


stopifnot(isTRUE(all.equal(mean(inverse.rle(x)),mean(x))))
stopifnot(isTRUE(all.equal(mean(inverse.rle(y)),mean(y))))


stopifnot(isTRUE(all.equal(length(inverse.rle(x)),length(x))))
stopifnot(isTRUE(all.equal(length(inverse.rle(y)),length(y))))

x$values[1] <- NA
y$values[1] <- NA
stopifnot(isTRUE(all.equal(is.na(inverse.rle(x)),inverse.rle(is.na(x)))))
stopifnot(isTRUE(all.equal(is.na(inverse.rle(y)),inverse.rle(is.na(y)))))


x <- rle(sample(c(-1,+1), 10, c(.7,.3), replace=TRUE))
y <- rpois(length(x$lengths), 2)

stopifnot(isTRUE(all.equal(rep(inverse.rle(x), rep(y, x$lengths)),
                               inverse.rle(rep(x, y, scale="run")))))

stopifnot(isTRUE(all.equal(rep(inverse.rle(x), max(y)),
                               inverse.rle(rep(x, max(y), scale="element")))))




