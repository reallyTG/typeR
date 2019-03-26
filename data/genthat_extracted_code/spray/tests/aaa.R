require("spray")
stopifnot(value(constant(subs(homog(2,2),1,10))) == 100)
stopifnot(value(subs(product(1:3),3,10))==1000)

a <- spray(diag(5))
stopifnot(is.empty(a[2,3,4,1,5]))
