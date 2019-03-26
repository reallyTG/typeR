library(bigleaf)


### Name: radiometric.surface.temp
### Title: Radiometric Surface Temperature
### Aliases: radiometric.surface.temp

### ** Examples

# determine radiometric surface temperature for the site DE-Tha in June 2014 
# assuming an emissivity of 0.98.
# (Note that variable 'LW_down' was only included for the DE-Tha example dataset
# and not for the others due restrictions on file size) 
Trad <- radiometric.surface.temp(DE_Tha_Jun_2014,emissivity=0.98)
summary(Trad)




