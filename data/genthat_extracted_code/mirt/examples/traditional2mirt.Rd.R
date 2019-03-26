library(mirt)


### Name: traditional2mirt
### Title: Convert traditional IRT metric into slope-intercept form used in
###   mirt
### Aliases: traditional2mirt

### ** Examples


# classical 3PL model
vec <- c(a=1.5, b=-1, g=.1, u=1)
slopeint <- traditional2mirt(vec, '3PL', ncat=2)
slopeint

# classical graded model (four category)
vec <- c(a=1.5, b1=-1, b2=0, b3=1.5)
slopeint <- traditional2mirt(vec, 'graded', ncat=4)
slopeint

# classical generalize partial credit model (four category)
vec <- c(a=1.5, b1=-1, b2=0, b3=1.5)
slopeint <- traditional2mirt(vec, 'gpcm', ncat=4)
slopeint

# classical nominal model (4 category)
vec <- c(a1=.5, a2 = -1, a3=1, a4=-.5, d1=1, d2=-1, d3=-.5, d4=.5)
slopeint <- traditional2mirt(vec, 'nominal', ncat=4)
slopeint





