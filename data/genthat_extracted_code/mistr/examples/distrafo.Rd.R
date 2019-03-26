library(mistr)


### Name: Distribution_transformation
### Title: Transformation of a Distribution Object
### Aliases: Distribution_transformation +.univdist +.trans_univdist
###   *.univdist *.trans_univdist /.dist -.dist sqrt.dist log.univdist
###   log.trans_univdist exp.univdist exp.trans_univdist ^.univdist
###   ^.trans_univdist +.normdist *.normdist exp.normdist *.expdist
###   ^.expdist +.unifdist *.unifdist ^.tdist ^.fdist -.betadist
###   -.binomdist *.gammadist +.cauchydist *.cauchydist ^.cauchydist
###   *.lnormdist log.lnormdist ^.lnormdist *.weibulldist +.gumbeldist
###   *.gumbeldist +.frechetdist *.frechetdist *.paretodist +.GPDdist
###   *.GPDdist

### ** Examples

# transformation
B  <- binomdist(10, 0.3)
B2 <- - 3*log(B)
B2

# invariant transformation
N  <- normdist(1, 3)
N2 <- - 3*N + 5
N2

# direct transformation
N3 <- exp(N2)
N3

# recognize inverse
B3 <- exp(B2/-3)
B3
# update
B4 <- B + 5
B4 + 3




