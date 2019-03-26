library(deducorrect)


### Name: correctTypos
### Title: Correct records under linear restrictions using typographical
###   error suggestions
### Aliases: correctTypos correctTypos.editmatrix correctTypos.editset

### ** Examples

library(editrules)

# example from section 4 in Scholtus (2009)

E <- editmatrix( c("x1 + x2 == x3"
                  ,"x2 == x4"
                  ,"x5 + x6 + x7 == x8"
                  ,"x3 + x8 == x9"
                  ,"x9 - x10 == x11"
                  )
               )

dat <- read.csv(txt<-textConnection(
"    , x1, x2 , x3  , x4 , x5 , x6, x7, x8 , x9   , x10 , x11
4  , 1452, 116, 1568, 116, 323, 76, 12, 411,  1979, 1842, 137
4.1, 1452, 116, 1568, 161, 323, 76, 12, 411,  1979, 1842, 137
4.2, 1452, 116, 1568, 161, 323, 76, 12, 411, 19979, 1842, 137
4.3, 1452, 116, 1568, 161,   0,  0,  0, 411, 19979, 1842, 137
4.4, 1452, 116, 1568, 161, 323, 76, 12,   0, 19979, 1842, 137"
))
close(txt)
(cor <- correctTypos(E,dat))



# example with editset
E <- editset(expression(
    x + y == z,
    x >= 0,
    y > 0,
    y < 2,
    z > 1,
    z < 3,
    A %in% c('a','b'),
    B %in% c('c','d'),
    if ( A == 'a' ) B == 'b',
    if ( B == 'b' ) x > 3
))

x <- data.frame(
    x = 10,
    y = 1,
    z = 2,
    A = 'a',
    B = 'b'
)

correctTypos(E,x)





