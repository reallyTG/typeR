library(GEOmap)


### Name: TOPOCOL
### Title: Create Topography ColorMAP
### Aliases: TOPOCOL
### Keywords: misc

### ** Examples


colk1 = 50
colk2 = 210
colk3 = 220
colk4 = 250
BWpal2 = list(z1=c(-3000, 0, 2000, 3500),
r1=c(0,colk1, colk3, colk4),
g1=c(0,colk1, colk3, colk4),
b1=c(0,colk1, colk3, colk4),
z2=c(0, 2000, 3500, 5000),
r2=c(0,colk2,colk4,255),
g2=c(0,colk2,colk4,255),
b2=c(0,colk2,colk4,255),
note=c("black, black", "grey, grey", "white, white", "white, white")
)


data(volcano)

MYCOLL = TOPOCOL(volcano, BWpal2)

   z <- 2 * volcano        # Exaggerate the relief
     x <- 10 * (1:nrow(z))   # 10 meter spacing (S to N)
     y <- 10 * (1:ncol(z))   # 10 meter spacing (E to W)
     ## Don't draw the grid lines :  border = NA
     par(bg = "slategray")
Dcol = attr(  MYCOLL , "Dcol")

     persp(x, y, z, theta = 135, phi = 30,
         col = MYCOLL[1:(Dcol[1]-1), 1:(Dcol[2]-1)], scale = FALSE,
           ltheta = -120, shade = 0.75, border = NA, box = FALSE)


calcol=settopocol()
MYCOLL = TOPOCOL(volcano, calcol$calcol)

Dcol = attr(  MYCOLL , "Dcol")

  K <- 8 *volcano

MYCOLL = TOPOCOL(K, calcol$calcol)

     persp(x, y, z, theta = 135, phi = 30,
           col = MYCOLL[1:(Dcol[1]-1), 1:(Dcol[2]-1)], scale = FALSE,
           ltheta = -120, shade = 0.75, border = NA,  box = FALSE)







