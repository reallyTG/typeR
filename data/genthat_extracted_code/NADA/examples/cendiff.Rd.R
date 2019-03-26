library(NADA)


### Name: cendiff
### Title: Test Censored ECDF Differences
### Aliases: cendiff
### Keywords: survival

### ** Examples


    data(Cadmium)

    obs      = Cadmium$Cd
    censored = Cadmium$CdCen
    groups   = Cadmium$Region

    # Cd differences between regions?
    cendiff(obs, censored, groups)
    
    # Same as above using formula interface
    cenfit(Cen(obs, censored)~groups) 



