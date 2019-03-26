library(deducorrect)


### Name: correctRounding
### Title: Correct records under linear restrictions for rounding errors
### Aliases: correctRounding correctRounding.editmatrix
###   correctRounding.editset

### ** Examples


E <- editmatrix(expression( 
    x1 + x2 == x3,
    x2 == x4,
    x5 + x6  + x7 == x8,
    x3 + x8 == x9,
    x9 - x10 == x11
    )
)

dat <- data.frame( x1=12
                 , x2=4
                 , x3=15
                 , x4=4
                 , x5=3
                 , x6=1
                 , x7=8
                 , x8=11
                 , x9=27
                 , x10=41
                 , x11=-13
                 )

sol <- correctRounding(E, dat)


# example with editset
for ( d in dir("../pkg/R/",full.names=TRUE) ) dmp <- source(d)
E <- editmatrix(expression(
    x + y == z,
    x >= 0,
    y >= 0,
    z >= 0,
    if ( x > 0 ) y > 0
    ))
dat <- data.frame(
    x = 1,
    y = 0,
    z = 1)
# solutions causing new violations of conditional rules are rejected 
sol <- correctRounding(E,dat)

# An example with editset
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
    if ( B == 'b' ) x < 1
))
dat <- data.frame(
    x = 0,
    y = 1,
    z = 2,
    A = 'a',
    B = 'b'
)

correctRounding(E,dat)    




