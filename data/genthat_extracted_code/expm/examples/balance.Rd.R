library(expm)


### Name: balance
### Title: Balance a Square Matrix via LAPACK's DGEBAL
### Aliases: balance dgebal
### Keywords: array arith

### ** Examples

m4 <- rbind(c(-1,-1, 0, 0),
            c( 0, 0,10,10),
            c( 0, 0,10, 0),
            c( 0,10, 0, 0))
(b4 <- balance(m4))

## --- for testing and didactical reasons : ----

demo(balanceTst) # also defines the balanceTst() function
                # which in its tests ``defines'' what
                # the return value means, notably (i1,i2,scale)



