library(geophys)


### Name: Showfry
### Title: Show Fry Diagrams
### Aliases: Showfry
### Keywords: misc

### ** Examples


RDAT = randFRY(400, LIM=c(0,0, 200, 200) , rlen=5   )
length(RDAT$x)
plot(RDAT$x, RDAT$y, asp=1, pch=".", cex=2)

u = par( no.readonly = TRUE)


par(mfrow=c(3,2))
    shr = 0.0
simpleshear = matrix(c(1, shr, 0,  1), ncol=2)

Showfry(RDAT, simpleshear, 75)
    shr = 1.2
simpleshear = matrix(c(1, shr, 0,  1), ncol=2)

Showfry(RDAT, simpleshear, 75)

epsilon1 = 0.4
H = matrix(c(1+epsilon1, 0, 0,  1/(1+epsilon1) ), ncol=2)

Showfry(RDAT, H, 75)

par(u)





