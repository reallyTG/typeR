library(cwhmisc)


### Name: normalize
### Title: base power and multiplier, significant places
### Aliases: normalize normalize1 Nd sigplaces checkNormalize
### Keywords: math

### ** Examples

(xx <- c(exp(1),pi,NA, Inf, -Inf,10,100,c(1,10)*exp(1)) )
(x2 <- normalize(xx,2))
#          A         B  C   D   E    F      G         H         I
# a 1.3591409 1.5707963 NA Inf Inf 1.25 1.5625 1.3591409 1.6989261
# e 1.0000000 1.0000000  0   0   0 3.00 6.0000 1.0000000 4.0000000
# b 2.0000000 2.0000000  2   2   2 2.00 2.0000 2.0000000 2.0000000

(x32 <- normalize1(xx,2))
#           A          B   C   D   E     F       G          H          I
# a 0.67957046 0.785398 NA Inf Inf 0.625 0.78125 0.67957 0.849463
# e 2.00000000 2.000000  1   1   1 4.000 7.00000 2.00000 5.000000
# b 2.00000000 2.000000  2   2   2 2.000 2.00000 2.00000 2.000000

(x10 <- normalize(xx,10))
#           A          B  C   D   E  F  G          H          I
# a  2.7182818  3.1415927 NA Inf Inf  1  1  2.7182818  2.7182818
# e  0.0000000  0.0000000  0   0   0  1  2  0.0000000  1.0000000
# b 10.0000000 10.0000000 10  10  10 10 10 10.0000000 10.0000000

(x7 <- normalize(xx,7))
#           A         B  C   D   E         F         G         H         I
# a 2.7182818 3.1415927 NA Inf Inf 1.42857 2.0408 2.71828 3.8832598
# e 0.0000000 0.0000000  0   0   0 1.00000 2.0000 0.00000 1.0000000
# b 7.0000000 7.0000000  7   7   7 7.00000 7.0000 7.00000 7.0000000

sigplaces(-9.999) #
sigplaces(pi/100) #

all.equal(checkNormalize(x2), checkNormalize(x7)) # TRUE




