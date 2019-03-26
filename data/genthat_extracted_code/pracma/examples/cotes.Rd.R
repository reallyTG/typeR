library(pracma)


### Name: cotes
### Title: Newton-Cotes Formulas
### Aliases: cotes
### Keywords: math

### ** Examples

cotes(sin, 0, pi/2, 20, 2)      # 0.999485905248533
cotes(sin, 0, pi/2, 20, 3)      # 1.000000211546591
cotes(sin, 0, pi/2, 20, 4)      # 1.000000391824184
cotes(sin, 0, pi/2, 20, 5)      # 0.999999999501637
cotes(sin, 0, pi/2, 20, 6)      # 0.999999998927507
cotes(sin, 0, pi/2, 20, 7)      # 1.000000000000363  odd degree is better
cotes(sin, 0, pi/2, 20, 8)      # 1.000000000002231



