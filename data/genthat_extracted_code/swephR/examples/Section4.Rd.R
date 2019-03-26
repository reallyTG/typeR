library(swephR)


### Name: Section4
### Title: Section 4: Fixed stars functions
### Aliases: Section4 swe_fixstar2_mag swe_fixstar2 swe_fixstar2_ut

### ** Examples

data(SE)
swe_fixstar2_mag("sirius") 
swe_set_topo(0,50,10)      
swe_fixstar2("sirius",1234567,SE$FLG_TOPOCTR+SE$FLG_MOSEPH+SE$FLG_EQUATORIAL)
swe_fixstar2_ut("sirius",1234567,SE$FLG_TOPOCTR+SE$FLG_MOSEPH+SE$FLG_EQUATORIAL)



