## Check aderiv(), which is not easily assessed in the checker()
## framework of aaa.R:

library("mvp")


P <- as.mvp("1 + x + x^3 z + 4 x^2 y + 4 z^4")^3
stopifnot(aderiv(P,x=1,y=2,z=3) == aderiv(P,z=3,x=1,y=2))



stopifnot(aderiv(as.mvp("x^6 y"),x=2,y=1) == as.mvp("30 x^4"))


