library(geophys)


### Name: lipper
### Title: Ellipse calculator
### Aliases: lipper
### Keywords: misc

### ** Examples


LIP = lipper(10, 3, 9)

theta  = seq(from=0, to=2*pi, length=360)

        phi = LIP[3]
        px = LIP[1]*cos(theta)*cos(phi)-  LIP[2]*sin(theta)*sin(phi)
        py = LIP[1]*cos(theta)*sin(phi) + LIP[2]*sin(theta)*cos(phi)


plot(px, py, type='p', asp=1)
lines(px, py)





