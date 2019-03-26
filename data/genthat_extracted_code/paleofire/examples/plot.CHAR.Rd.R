library(paleofire)


### Name: plot.CHAR
### Title: Plot CHAR
### Aliases: plot.CHAR

### ** Examples

## Not run: 
##D ## In this example we will use the charcoal record of the Lac du Loup (Blarquez et al. 2010)
##D ## Load raw charcoal data in mm^2
##D A=read.csv("http://blarquez.com/public/code/loupchar.csv")
##D C_=A[,6] # charcoal areas
##D P_=A[,1:5] # CmTop, CmBot, AgeTop, AgeBot, Volume
##D 
##D 
##D ## Calculates charcoal accumulation rate (CHAR, mm2.cm-2.yr-1)
##D CHAR=pretreatment(params=P_,serie=C_,Int=TRUE)
##D plot(CHAR)
## End(Not run)




