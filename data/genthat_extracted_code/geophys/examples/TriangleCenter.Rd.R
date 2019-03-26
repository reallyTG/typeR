library(geophys)


### Name: TriangleCenter
### Title: Triangle Center
### Aliases: TriangleCenter
### Keywords: misc

### ** Examples


S = stressSETUP()
pstart()

PLOTbox(S$Rax, S$Rbox, axcol= 'green', boxcol= 'purple')

pstart()

PLOTplane(S$Rp, planecol="brown")
PLOTbox(S$Rax, S$Rbox, axcol= 'green', boxcol= 'purple')


NORMvec(S$PPs, S$xscale, S$Rview, S$aglyph, add=TRUE)
   P1 = S$PPs[1, 1:3] 
    P2 = S$PPs[2, 1:3] 
    P3 = S$PPs[3, 1:3]

BV = TriangleCenter(S$PPs[1,1:3],S$PPs[2,1:3], S$PPs[3,1:3] )

 CIRCview =   BV$Cinscribed  

    lines(CIRCview[,1], CIRCview[,2], col='purple')

cview =   BV$Center  

    points(cview[1,1], cview[1,2])





