#'  spatstat.utils/tests/segments.R

require(spatstat.utils)

#' test of distppll pointed out by Ang Qi Wei

p <- matrix(c(1.5, 0), 1, 2)
l <- matrix(c(0,0,1,0,1,0,2,0), 2, 4, byrow=T)
a <- distppll(p, l, mintype=2, method="interpreted")
d <- distppll(p, l, mintype=2, method="C")
if(a$min.which != d$min.which)
  stop("conflict between C and interpreted code in distppll")

