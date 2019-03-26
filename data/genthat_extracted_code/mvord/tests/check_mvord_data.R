
## --------------- mvord_data  ----------------------------------------------
data <- data.frame(firm= rep(1:3, each = 3), rater = c("A",3,1,1,2,3,1,2,3), X1 = rep(1,9), X2 = 1:9, yy = 1:9)
index <- c("firm", "rater")
y.names <- "yy"
x.names <- c("X1", "X2")
response.names <- c("A",1,3,2)


data.mvord <- mvord:::mvord_data(data, index, y.names, 
      x.names, y.levels = NULL, response.names)
tmp <- cbind.data.frame( A = ordered(c(1,NA,NA)),
                         "1" = ordered(c(3,4,7)),
                         "3" = ordered(c(2,6,9)),
                         "2" = ordered(c(NA,5,8)))
mvord:::check(identical(data.mvord$y, tmp))


tmp <- list( A = cbind.data.frame(X1 = c(1,NA,NA), X2 = as.integer(c(1,NA,NA))),
             '1'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(3,4,7))),
             '3'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(2,6,9))),
             '2'= cbind.data.frame(X1 =c(NA,1,1),X2 = as.integer(c(NA,5,8))))
tmp <- lapply(tmp, function(i){
  rownames(i) <- 1:3
  i
})
mvord:::check(identical(data.mvord$x, tmp))


###############
data <- data.frame(firm= rep(1:3, each = 3), rater = c("A",3,1,1,2,3,1,2,3), X1 = rep(1,9), X2 = 1:9, yy = c("B","c",1,3,"X","a",1,"Z","b"))
index <- c("firm", "rater")
y.names <- "yy"
x.names <- c("X1", "X2")
response.names <- c("A",1,3,2)
y.levels <- list("B", c("3","1"), c("a","b","c"),c("Z","X"))


z <- mvord:::mvord_data(data, index, y.names, x.names, y.levels, 
      response.names)


mvord:::check(identical(z$y[,1], ordered(c("B",NA,NA), levels = "B")))
mvord:::check(identical(z$y[,2], ordered(c(1,3,1), levels = c("3","1"))))
mvord:::check(identical(z$y[,3], ordered(c("c","a","b"), levels =  c("a","b","c"))))
mvord:::check(identical(z$y[,4], ordered(c(NA,"X","Z"), levels = c("Z","X"))))

#-------------------------------------------------------------------------------------
#ERRORS
data <- data.frame(firm= rep(1:3, each = 3), rater = c("A",3,1,1,2,3,1,2,3), X1 = rep(1,9), X2 = 1:9, yy = c("B","c",1,3,"X","a",1,"Z","b"))
index <- c("firm", "rater")
y.names <- "yy"
x.names <- c("X1", "X2")
response.names <- c("A",1,3,2)
y.levels <- list("C", c("3","1"), c("a","b","c"),c("Z","X"))

#should not work
mvord:::check(!is.null(attr(try(mvord:::mvord_data(data, index, y.names, x.names, y.levels, response.names, contrasts=NULL), silent = TRUE), "condition")))

data <- data.frame(firm= rep(1:3, each = 3), rater = c("A","A",1,1,2,3,1,2,3), X1 = rep(1,9), X2 = 1:9, yy = c("B","c",1,3,"X","a",1,"Z","b"))
index <- c("firm", "rater")
y.names <- "yy"
x.names <- c("X1", "X2")
response.names <- c("A",1,3,2)
y.levels <- list("B", c("3","1"), c("a","b","c"),c("Z","X"))

#should not work
mvord:::check(!is.null(attr(try(mvord:::mvord_data(data, index, y.names, x.names, y.levels, response.names, contrasts=NULL), silent = TRUE), "condition")))
#-------------------------------------------------------------------------------------

data <- data.frame(firm= rep(1:3, each = 3), year = c(2007,2003,2001,2001,2002,2003,2001,2002,2003), X1 = rep(1,9), X2 = 1:9, yy = c("B","c",1,3,"X","a",1,"Z","b"))
index <- c("firm", "year")
y.names <- "yy"
x.names <- c("X1", "X2")
response.names <- c(2001:2003,2007)
y.levels <- list(c("3","1"),c("Z","X"), c("a","b","c"), "B")
z <- mvord:::mvord_data(data, index, y.names, x.names, y.levels, response.names)
mvord:::check(identical(z$y[,1], ordered(c(1,3,1), levels = c("3","1"))))
mvord:::check(identical(z$y[,2], ordered(c(NA,"X","Z"), levels = c("Z","X"))))
mvord:::check(identical(z$y[,3], ordered(c("c","a","b"), levels =  c("a","b","c"))))
mvord:::check(identical(z$y[,4], ordered(c("B",NA,NA), levels = c("B"))))
tmp <- list( '2001' = cbind.data.frame(X1 = c(1,1,1), X2 = as.integer(c(3,4,7))),
             '2002'= cbind.data.frame(X1 =c(NA,1,1),X2 = as.integer(c(NA,5,8))),
             '2003'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(2,6,9))),
             '2007'= cbind.data.frame(X1 =c(1,NA,NA),X2 = as.integer(c(1,NA,NA))))
mvord:::check(identical(z$x, tmp))


response.names <- c(2001:2007)
y.levels <- list(c("3","1"),c("Z","X"), c("a","b","c"), NA,NA,NA,"B")
z <- mvord:::mvord_data(data, index, y.names, x.names, y.levels, response.names)
mvord:::check(identical(z$y[,1], ordered(c(1,3,1), levels = c("3","1"))))
mvord:::check(identical(z$y[,2], ordered(c(NA,"X","Z"), levels = c("Z","X"))))
mvord:::check(identical(z$y[,3], ordered(c("c","a","b"), levels =  c("a","b","c"))))
mvord:::check(identical(z$y[,4], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,5], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,6], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,7], ordered(c("B",NA,NA), levels = c("B"))))
tmp <- list( '2001'= cbind.data.frame(X1 = c(1,1,1), X2 = as.integer(c(3,4,7))),
             '2002'= cbind.data.frame(X1 =c(NA,1,1),X2 = as.integer(c(NA,5,8))),
             '2003'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(2,6,9))),
             '2004'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2005'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2006'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)), X2 = as.integer(c(NA,NA,NA))),
             '2007'= cbind.data.frame(X1 =c(1,NA,NA),X2 = as.integer(c(1,NA,NA))))
# problem is with the attributes?
mvord:::check(all.equal(z$x, tmp))

response.names <- c(2001:2008)
y.levels <- list(c("3","1"),c("Z","X"), c("a","b","c"), NA,NA,NA,"B",NA)
z <- mvord:::mvord_data(data, index, y.names, x.names, y.levels, response.names)
mvord:::check(identical(z$y[,1], ordered(c(1,3,1), levels = c("3","1"))))
mvord:::check(identical(z$y[,2], ordered(c(NA,"X","Z"), levels = c("Z","X"))))
mvord:::check(identical(z$y[,3], ordered(c("c","a","b"), levels =  c("a","b","c"))))
mvord:::check(identical(z$y[,4], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,5], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,6], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,7], ordered(c("B",NA,NA), levels = c("B"))))
mvord:::check(identical(z$y[,8], ordered(c(NA,NA,NA))))
tmp <- list( '2001' = cbind.data.frame(X1 = c(1,1,1), X2 = as.integer(c(3,4,7))),
             '2002'= cbind.data.frame(X1 =c(NA,1,1),X2 = as.integer(c(NA,5,8))),
             '2003'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(2,6,9))),
             '2004'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2005'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2006'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2007'= cbind.data.frame(X1 =c(1,NA,NA),X2 = as.integer(c(1,NA,NA))),
             '2008'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))))
mvord:::check(all.equal(z$x, tmp))

response.names <- c(2000:2008)
y.levels <- list(NA,c("3","1"),c("Z","X"), c("a","b","c"), NA,NA,NA,"B",NA)
z <- mvord:::mvord_data(data, index, y.names, x.names, y.levels, response.names)
mvord:::check(identical(z$y[,1], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,2], ordered(c(1,3,1), levels = c("3","1"))))
mvord:::check(identical(z$y[,3], ordered(c(NA,"X","Z"), levels = c("Z","X"))))
mvord:::check(identical(z$y[,4], ordered(c("c","a","b"), levels =  c("a","b","c"))))
mvord:::check(identical(z$y[,5], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,6], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,7], ordered(c(NA,NA,NA))))
mvord:::check(identical(z$y[,8], ordered(c("B",NA,NA), levels = c("B"))))
mvord:::check(identical(z$y[,9], ordered(c(NA,NA,NA))))
tmp <- list( '2000'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2001'= cbind.data.frame(X1 =c(1,1,1), X2 = as.integer(c(3,4,7))),
             '2002'= cbind.data.frame(X1 =c(NA,1,1),X2 = as.integer(c(NA,5,8))),
             '2003'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(2,6,9))),
             '2004'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2005'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2006'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))),
             '2007'= cbind.data.frame(X1 =as.integer(c(1,NA,NA)),X2 = as.integer(c(1,NA,NA))),
             '2008'= cbind.data.frame(X1 =as.integer(c(NA,NA,NA)),X2 = as.integer(c(NA,NA,NA))))
mvord:::check(all.equal(z$x, tmp))


# rater 3 not used in mvord
data <- data.frame(firm= rep(1:3, each = 3), rater = c("A",3,1,1,2,3,1,2,3), X1 = rep(1,9), X2 = 1:9, yy = 1:9)
index <- c("firm", "rater")
y.names <- "yy"
x.names <- c("X1", "X2")
response.names <- c("A",1,2)


data.mvord <- mvord:::mvord_data(data, index, y.names, x.names, y.levels = NULL, response.names)
tmp <- cbind.data.frame( A = ordered(c(1,NA,NA)),
                         "1" = ordered(c(3,4,7)),
                         #"3" = ordered(c(2,6,9)),
                         "2" = ordered(c(NA,5,8)))
mvord:::check(identical(data.mvord$y, tmp))


tmp <- list( A = cbind.data.frame(X1 = c(1,NA,NA), X2 = as.integer(c(1,NA,NA))),
             '1'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(3,4,7))),
             #'3'= cbind.data.frame(X1 =c(1,1,1),X2 = as.integer(c(2,6,9))),
             '2'= cbind.data.frame(X1 =c(NA,1,1),X2 = as.integer(c(NA,5,8))))
tmp <- lapply(tmp, function(i){
  rownames(i) <- 1:3
  i
})
mvord:::check(identical(data.mvord$x, tmp))