library(RSEIS)


### Name: parseFN2STA
### Title: get station from file name
### Aliases: parseFN2STA
### Keywords: misc

### ** Examples


parseFN2STA('/data/wadati/bourbon/GUATEMALA/SEGY/R009.01/07.009.22.25.34.CAS.E')

fn  <- "2011-11-06-0637-21S.SI01__003_SI01__SH_N_SAC"

parseFN2STA(fn, 4, 1, sep="_"  )
### or:
parseFN2STA(fn, 4, 7, sep="_", dir=1  )





