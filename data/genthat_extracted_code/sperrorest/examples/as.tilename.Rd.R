library(sperrorest)


### Name: as.tilename
### Title: Alphanumeric tile names
### Aliases: as.tilename tilename as.tilename_numeric as.tilename.numeric
###   as.character.tilename as.numeric.tilename as.tilename_character
###   as.tilename.character print.tilename

### ** Examples

tnm <- as.tilename(c(2,3))
tnm # 'X2:Y3'
as.numeric(tnm) # c(2,3)



