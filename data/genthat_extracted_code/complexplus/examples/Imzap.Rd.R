library(complexplus)


### Name: Imzap
### Title: Rounding of Null Imaginary Part of a Complex Number
### Aliases: Imzap

### ** Examples

x1 <- 1:100
x2 <- c(1:98,2+3i,0-5i)
x3 <- c(1:98,2+0i,7-0i)
x4 <- complex(real = rnorm(100), imaginary = rnorm(100))

Imzap(x1)  # inocuous with real vectors
Imzap(x2)  # 1 single element is enough to turn the vector into complex
Imzap(x3)  # removes extra 0i and changes class from from complex to numeric
Imzap(x4)  # inocuous with complex vectors with non-null complex part




