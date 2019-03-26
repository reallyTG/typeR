library(paleofire)


### Name: pretreatment
### Title: Calculate particules accumulation rates for sediment records
### Aliases: pretreatment

### ** Examples


## Not run: 
##D # In this example we will use the charcoal record of the Lac du Loup from Blarquez et al. (2010).
##D # Blarquez, O., C. Carcaillet, B. Mourier, L. Bremond, and O. Radakovitch. 2010. Trees in the
##D # subalpine belt since 11 700 cal. BP: origin, expansion and alteration of the modern forest.
##D # The Holocene 20:139-146.
##D 
##D # Load raw charcoal data in mm^2
##D A=read.csv("http://blarquez.com/public/code/loupchar.csv")
##D C_=A[,6] # charcoal areas
##D P_=A[,1:5] # CmTop, CmBot, AgeTop, AgeBot, Volume
##D 
##D # Calculates charcoal accumulation rate (CHAR, mm2.cm-2.yr-1)
##D CHAR=pretreatment(params=P_,serie=C_,Int=TRUE)
##D plot(CHAR)
## End(Not run)




