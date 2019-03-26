library(geophys)


### Name: mogi1
### Title: Mogi's model
### Aliases: mogi1
### Keywords: misc

### ** Examples


P=1e5
a = 0.1
    f = 1

 nu=0.25
    E = 10e9

mu = E/(2*(1+nu));
  
#############
rho = seq(from=-3, to=3, by=0.1)
o1 = mogi1(a, P, rho, mu, f)
plot(rho, o1$uz)

plot(rho, o1$ud)






EX = seq(from=-3, by=.1, to= 3)

mm = RPMG::meshgrid(EX, EX)

rho = sqrt(mm$x^2 +  mm$y^2)

o1 = mogi1(a, P, rho, mu, f)

#############
image(EX, EX, o1$uz, asp=1)


contour(    EX, EX, o1$uz, add=TRUE)
#############
image(EX, EX, o1$ur, asp=1)


contour(    EX, EX, o1$ur, add=TRUE)

#############
image(EX, EX, o1$uz, asp=1)
contour(    EX, EX, o1$ur, add=TRUE)





