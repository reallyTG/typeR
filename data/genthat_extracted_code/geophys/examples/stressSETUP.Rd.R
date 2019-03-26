library(geophys)


### Name: stressSETUP
### Title: Setup Stress Box
### Aliases: stressSETUP
### Keywords: misc

### ** Examples



S = stressSETUP()
pstart()

PLOTbox(S$Rax, S$Rbox, axcol= 'green', boxcol= 'purple')

pstart()

PLOTplane(S$Rp, planecol="brown")
PLOTbox(S$Rax, S$Rbox, axcol= 'green', boxcol= 'purple')


NORMvec(S$PPs, S$xscale, S$Rview, S$aglyph, add=TRUE)





