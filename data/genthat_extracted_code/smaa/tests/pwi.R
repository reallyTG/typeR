library(smaa)

meas <- array(dim=c(10, 2, 1))
meas[,1,] <- 1
meas[,2,] <- 0
meas[1,1,1] <- 0
meas[1,2,1] <- 1

dimnames(meas) <- list(NULL, c('a1', 'a2'), NULL)

w <- array(1, dim=c(10, 1))

vals <- smaa.values(meas, w)
ranks <- smaa.ranks(vals)

pwi <- smaa.pwi(ranks)
stopifnot(pwi[1, 1] == 0.0)
stopifnot(pwi[2, 2] == 0.0)
stopifnot(pwi[1, 2] == 0.9)
stopifnot(pwi[2, 1] == 0.1)
