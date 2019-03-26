library(emuR)


### Name: epgcog
### Title: Electropalatographic centre of gravity
### Aliases: epgcog
### Keywords: math

### ** Examples


#  COG: trackdata
cog <- epgcog(coutts.epg)
#  cog, one-columned matrix
cog <- epgcog(dcut(coutts.epg, 0.5, prop=TRUE))
# posterior cog for Fig. 10.5, p. 239 in Gibbon & Nicolaidis (1999)
r = array(0, c(8, 8, 2))
r[6,c(1, 8),1] <- 1
r[7,c(1, 2, 7, 8), 1] <- 1
r[8, ,1] <- 1
r[4, c(1, 2, 8), 2] <- 1
r[5, c(1, 2, 7, 8), 2] <- 1
r[6, c(1, 2, 3, 7, 8), 2] <- 1
r[7:8, , 2] = 1
class(r) <- "EPG"
epgcog(r, rows=5:8, columns=3:6)




