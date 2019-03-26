library(olctools)


### Name: shorten_olc
### Title: Shorten Full Open Location Codes
### Aliases: shorten_olc

### ** Examples

#Encode an OLC and then shorten it
olc <- encode_olc(51.3708675,-1.217765625, 12)
validate_full(olc)
# [1] TRUE

olc <- shorten_olc(olc, 51.3708675,-1.217765625)
validate_short(olc)
# [1] TRUE




