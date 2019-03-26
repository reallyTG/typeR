library(vegdata)


### Name: isc
### Title: Indicate site conditions with community weighted mean values of
###   traits or with mode of gradient classes (sum of species amplitudes).
### Aliases: isc showindiplot
### Keywords: misc

### ** Examples

## Not run: 
##D db <- 'elbaue'
##D veg <- tv.veg(db, cover.transform='sqrt', check.critical = FALSE)
##D site <- tv.site(db, verbose = FALSE)
##D # Exclude plots with very high water level fluctuation
##D veg <- veg[site$SDGL < 60,]
##D veg <- veg[,colSums(veg) > 0]
##D site <- site[site$SDGL < 60,]
##D # Load species trait value database
##D traits <- tv.traits(db)
##D 
##D # Mean indicator values of Ellenberg F values
##D mEIV_F <- isc(veg, trait.db = traits, ivname = 'OEK_F', method = 'mean')
##D plot(site$MGL, mEIV_F, xlab = 'Mean groundwater level')
##D 
##D # Mode (most frequent level) of Ellenberg F values
##D library(reshape)
##D traitmat <- cast(traits, LETTERCODE ~ OEK_F)
##D traitmat <- traitmat[,-14]
##D ilevel <- isc(veg, trait.db = traitmat, ivname = as.character(1:11), method = 'mode')
##D boxplot(site$MGL ~ ordered(ilevel, levels = levels(ilevel)[c(2,4,3,5,6:10,1)]))
## End(Not run)



