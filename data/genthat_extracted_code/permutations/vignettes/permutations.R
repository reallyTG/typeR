### R code from vignette source 'permutations.Rnw'

###################################################
### code chunk number 1: loadlibandperm
###################################################
library(permutations)
f <- as.word(c(9,2,6,3,5,4,1,7,8))
options(print_word_as_cycle = FALSE)
f


###################################################
### code chunk number 2: findfinverse
###################################################
inverse(f)


###################################################
### code chunk number 3: inverseidiom (eval = FALSE)
###################################################
## f[f] <- seq_along(f)


###################################################
### code chunk number 4: ascycleform
###################################################
as.cycle(f)
f^3


###################################################
### code chunk number 5: dputcycle
###################################################
dput(f)
dput(as.cycle(f))


###################################################
### code chunk number 6: invertcyclist (eval = FALSE)
###################################################
## lapply(cyc,function(o){c(o[1],rev(o[-1]))})


###################################################
### code chunk number 7: fg
###################################################
g <- as.word(9:1)
f*g
g*f


###################################################
### code chunk number 8: productform (eval = FALSE)
###################################################
## f*g == g[f]


###################################################
### code chunk number 9: commutator
###################################################
commutator(f,g)


###################################################
### code chunk number 10: showprint
###################################################
options(print_word_as_cycle = TRUE)
commutator(f,g)
commutator(g,f)


###################################################
### code chunk number 11: identity_shower
###################################################
f * inverse(f)


###################################################
### code chunk number 12: permutations.Rnw:272-275
###################################################
S4 <- allperms(4)
A4 <- S4[is.even(S4)]
A4


###################################################
### code chunk number 13: permutations.Rnw:290-291
###################################################
A4^cyc_len(5)


###################################################
### code chunk number 14: megaminx
###################################################
data(megaminx)
megaminx


###################################################
### code chunk number 15: permutations.Rnw:337-338
###################################################
a <- Pu / W * DY^-2 / Pu / DY


###################################################
### code chunk number 16: permutations.Rnw:346-347
###################################################
a


###################################################
### code chunk number 17: permutations.Rnw:354-355
###################################################
permorder(a)


###################################################
### code chunk number 18: permutations.Rnw:362-363
###################################################
a^6


###################################################
### code chunk number 19: permutations.Rnw:380-384
###################################################
X <- W / Pu * W * Pu^2 / DY^2
Y <- LG^(-1) / DB * LB * DG      
Z <- Gy^(-2) * LB / LG /Pi / LY
superflip83 <- (X^6)^Y + Z^9  # superflip (Jeremy Clark)


###################################################
### code chunk number 20: superflip_is_center
###################################################
jj <- permprod(sample(megaminx,30,replace=TRUE))
stopifnot(jj*superflip83 == superflip83*jj)


###################################################
### code chunk number 21: superflip82
###################################################
superflip82 <-
    LB^-1 * Gy^-1 * LB^-1 * O^3 * Gy * LY^2 * Gy^2 * 
        LY^3 * Gy^3 * LY^3/LB * Gy^2 * 
            ((Pu^-1 * W^2 * DY * DB * R)^9)^(O^3 * LB^3/LG) * 
                Gy^2/LB * O^3 * Gy * LY^2 * Gy^2 * LY^3 * Gy^3 * 
                    LY^3 / LB / Gy / LB * 
                    O^3 * Gy * LY^2 * Gy^2 * LY^3 * Gy^3 * LY^3

stopifnot(superflip82 == superflip83)


