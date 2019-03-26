library(rotations)


### Name: mis.angle
### Title: Misorientation angle
### Aliases: mis.angle mis.angle.Q4 mis.angle.SO3

### ** Examples

rs <- rcayley(20, kappa = 20)
Rs <- genR(rs, S = id.SO3)
mis.angle(Rs)

#If the central orientation is id.SO3 then mis.angle(Rs) and abs(rs) are equal
all.equal(mis.angle(Rs), abs(rs))  #TRUE

#For other reference frames, the data must be centered first
S <- genR(pi/2)
RsS <- genR(rs, S = S)
mis.axis(RsS-S)
all.equal(mis.angle(RsS-S),abs(rs)) #TRUE

#If the central orientation is NOT id.SO3 then mis.angle(Rs) and abs(rs) are usual unequal
Rs <- genR(rs, S = genR(pi/8))
all.equal(mis.angle(Rs), abs(rs))  #Mean relative difference > 0



