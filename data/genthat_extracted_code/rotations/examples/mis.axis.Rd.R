library(rotations)


### Name: mis.axis
### Title: Misorientation axis
### Aliases: mis.axis mis.axis.Q4 mis.axis.SO3

### ** Examples

rs <- rcayley(20, kappa = 20)

#If the reference frame is set to id.SO3 then no centering is required
Rs <- genR(rs, S = id.SO3)
mis.axis(Rs)
all.equal(Rs, as.SO3(mis.axis(Rs), mis.angle(Rs)))

#For other reference frames, the data must be centered first
S <- genR(pi/2)
RsS <- genR(rs, S = S)
mis.axis(RsS-S)
all.equal(mis.angle(RsS-S),abs(rs)) #TRUE

Qs <- genR(rs, S = id.Q4, space = "Q4")
mis.axis(Qs)
all.equal(Qs, as.Q4(mis.axis(Qs), mis.angle(Qs)))



