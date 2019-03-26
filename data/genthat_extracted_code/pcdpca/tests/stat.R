X = t(matrix(1:120,nrow=6))

Y = pcdpca:::stat2pc(X,2)
stopifnot(Y[2,1] == 2)
stopifnot(Y[3,2] ==9)
stopifnot(dim(Y) == c(40,3))

Y = pcdpca:::pc2stat(X,2)
stopifnot(Y[2,1] == 13)
stopifnot(Y[3,2] == 26)
stopifnot(dim(Y) == c(10,12))
