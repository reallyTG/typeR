library(caroline)


### Name: tab2df
### Title: Table to Data Frame
### Aliases: tab2df

### ** Examples


  x <- data.frame(a=runif(10),b=runif(10), z=rep(letters[1:5],2))
  as.data.frame(x)
  tab2df(x)
  x <- nv(rnorm(10), letters[1:10])
    as.data.frame(x)
  tab2df(x)
  x <- nv(rnorm(2), c('x.b','y.b'))
    as.data.frame(x)
  tab2df(x)
  x <- nv(rnorm(2), c('b.x','b.y'))
    as.data.frame(x)
  tab2df(x)
  e <- data.frame(a=runif(10),b=runif(10), z=rep(letters[13:17],2))
  x <- as.table(sapply(c('a','b'),function(cc) by(e[,'a'],list(e$z), sum)))
    as.data.frame(x)
  tab2df(x)
  x <- as.table(by(1:10, list(a=rep(1:5,2),b=rep(1:2,5)), sum))
    as.data.frame(x)
  tab2df(x)
  x <- as.table(nv(c(54,34), c('a','b')))
    as.data.frame(x)
  tab2df(x)

  x <- table(a='x',b='y')
  tab2df(x)
  
  


