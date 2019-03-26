library(geophys)


### Name: tauline
### Title: Shear Stress along Line
### Aliases: tauline tauplane
### Keywords: misc

### ** Examples



S= stressSETUP()


pstart()

     PLOTplane(S$Rp, planecol="brown")
     PLOTbox(S$Rax, S$Rbox, axcol= 'green', boxcol= 'purple')




##  L = locator(2)

L=list()
L$x=c(-13.6305297057, 52.6412739525)
L$y=c(26.2697350325,32.4501696158)


Stensor = matrix(c(
15, 0, 0,
0, 10, 0,
0,  0, 5), ncol=3)


P1 = list(x=L$x[1], y=L$y[1])
P2 = list(x=L$x[2], y=L$y[2])


ES = eigen(Stensor) 
NN = NORMvec(S$PPs, S$xscale, S$Rview, aglyph=S$aglyph, add=FALSE)

tauline(S$Rp, P1, P2, S$Rview, ES, NN)








