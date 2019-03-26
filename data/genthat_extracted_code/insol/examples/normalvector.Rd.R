library(insol)


### Name: normalvector
### Title: Vector normal to surface
### Aliases: normalvector

### ** Examples

# horizontal surface
normalvector(0,0)

# surface 45 degrees south
normalvector(45,180)

# range of surfaces 45 degrees E,SE,S,SW,W
normalvector(45,seq(90,270,45))

# Angle of incidence of the sun on a tilted surface 15 degrees south on March at Davos
jd = JD(seq(ISOdate(2019,3,20,0),ISOdate(2019,3,20,23),by="hour"))
degrees(acos(sunvector(jd,46.813,9.844,1) %*% as.vector(normalvector(15,180))))




