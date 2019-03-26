library(olctools)


### Name: validate_olc
### Title: Check the Validity of Open Location Codes
### Aliases: olc_validate validate_full validate_olc validate_short

### ** Examples

#Validate that a particular OLC is valid
validate_olc("WC2345+G6g")
#[1] TRUE

#It is! Is it a short?
validate_short("WC2345+G6g")
#[1] TRUE
#Yep!

#So it's not full?
validate_full("WC2345+G6g")
#[1] FALSE
#Nope!



