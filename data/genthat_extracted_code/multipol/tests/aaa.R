require(multipol)



# Some tests, which I just made up.  

 ## x is an arbitrary three-column matrix (it is actually the first
 ## three columns of a 21x21 magic square).

x <-
structure(c(209L, 187L, 165L, 143L, 121L, 99L, 77L, 55L, 33L, 
11L, 430L, 408L, 386L, 364L, 342L, 320L, 298L, 276L, 254L, 232L, 
231L, 186L, 164L, 142L, 120L, 98L, 76L, 54L, 32L, 10L, 429L, 
407L, 385L, 363L, 341L, 319L, 297L, 275L, 253L, 252L, 230L, 208L, 
163L, 141L, 119L, 97L, 75L, 53L, 31L, 9L, 428L, 406L, 384L, 362L, 
340L, 318L, 296L, 274L, 273L, 251L, 229L, 207L, 185L), .Dim = c(21L, 
3L))

a <- as.multipol(array(1:12,c(2,3,2)))  #just a random multipol
f1 <- as.function(a)
f2 <- as.function(a*a)

x1 <- floor(x/7)   


## now f1() and f2() are functions of arity three (the variables
## corresponding to the three columns of x1).  Check that the two ways
## of squaring match:

stopifnot(all(f1(x1)^2 == f2(x1)))

# Now some elementary factorizations (also given, but not verified, on
# constant.Rd):

# Factorize x^2 - y^2:
lhs <- ones(2) * linear(c(1,-1))    # (x+y)(x-y)
rhs <- single(2,1,2)-single(2,2,2)  # x^2-y^2
stopifnot(is.zero(rhs-lhs))

# Now factorize x^2 + y^2:
lhs <- linear(c(1,1i)) * linear(c(1,-1i))  # (x+iy)*(x-iy)
rhs <- ones(2,2)                           # x^2 + y^2
stopifnot(is.zero(rhs-lhs))

# Now factorize x^3 + y^3:
lhs <- ones(2) * (linear(c(1,1),2)-uni(2))   # (x+y)(x^2-xy+y^2)
rhs <- single(2,1,3) + single(2,2,3)
stopifnot(is.zero(rhs-lhs))

# Now x^5 + y^5:
lhs <- ones(2) * homog(2,4,c(1,-1,1,-1,1))  # (x+y) * ...
rhs <- single(2,1,5) + single(2,2,5)        # x^5+y^5  
stopifnot(is.zero(rhs-lhs))

# xyz = x*y*z:
lhs <- uni(3)
rhs <- single(3,1) * single(3,2) * single(3,3)
stopifnot(is.zero(rhs-lhs))

# x+y+z == x+y+z:
lhs <- single(3,1) + single(3,2) + single(3,3)
rhs <- ones(3)
stopifnot(is.zero(rhs-lhs))



# Now some tests of deriv:

a <- as.multipol(matrix(1:12,3,4))
da1 <- deriv(a,1)
da2 <- deriv(a,2)

stopifnot(all(da1 == matrix(c(2,6,5,12,8,18,11,24    ),nrow=2)))
stopifnot(all(da2 == matrix(c(4,5,6,14,16,18,30,33,36),nrow=3)))




## Now verify Euler's four-square identity, as seen in the vignette.  This is not run by default because it takes too long:


if(FALSE){
    lhs <- polyprod(ones(4,2),ones(4,2))  
    rhs <-
        (
            ( 
                +product(c(1,0,0,0, 1,0,0,0)) # +a1.b1
                -product(c(0,1,0,0, 0,1,0,0)) # -a2.b2
                -product(c(0,0,1,0, 0,0,1,0)) # -a3.b3
                -product(c(0,0,0,1, 0,0,0,1)) # -a4.b4
            )^2
            +( 
                +product(c(1,0,0,0, 0,1,0,0)) # +a1.b2
                +product(c(0,1,0,0, 1,0,0,0)) # +a2.b2
                +product(c(0,0,1,0, 0,0,0,1)) # +a3.b4
                -product(c(0,0,0,1, 0,0,1,0)) # -a4.b3
            )^2
            +( 
                +product(c(1,0,0,0, 0,0,1,0)) # +a1.b3
                -product(c(0,1,0,0, 0,0,0,1)) # -a2.b4
                +product(c(0,0,1,0, 1,0,0,0)) # +a3.b1
                +product(c(0,0,0,1, 0,1,0,0)) # +a4.b2
            )^2
            +( 
                +product(c(1,0,0,0, 0,0,0,1)) # +a1.b4
                +product(c(0,1,0,0, 0,0,1,0)) # +a2.b3
                -product(c(0,0,1,0, 0,1,0,0)) # -a3.b2
                +product(c(0,0,0,1, 1,0,0,0)) # +a4.b1
            )^2
        )
    
    stopifnot(is.zero(lhs-rhs))

}


# further work might include verifying Degen's eight square identity
# but this would involve an array of size 3^16 = 43046721 (which is no
# problem; the issue is mprod() taking a long time).
