library(Massign)


### Name: Massign
### Title: Construct a matrix from a (formatted) string
### Aliases: Massign %<-% %->%

### ** Examples

# Basic usage
M %<-% "   1,  0.2, -0.3,  0.4
         0.2,    1,  0.6, -0.4
        -0.3,  0.6,    1,  0.4
         0.4, -0.4,  0.4,    1"
M

# Variables allowed!
phi <- 1.5
V %<-% "1,     1,     1
        1,   phi, phi^2
        1, phi^2, phi^4"
V

# Lower triangular is made symmetric:
S %<-% "   1
         0.5,   1
        -0.2, 0.2,   1"
S

# Complex matrices work too:
C %<-% "  1+2i, 2+1i, 3+4i
        4+0.5i, 5+2i, 6+4i"
C

# And lastly, if you're a fan of LaTeX and one-liners:
L %<-% "1, 2, 3 \\ 4, 5, 6 \\ 7, 8, 9 \\ 10, 11, 12"
# (although this kind of defeats the WYSIWYG purpose of Massign)




