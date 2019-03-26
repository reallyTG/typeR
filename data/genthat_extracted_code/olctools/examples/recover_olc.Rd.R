library(olctools)


### Name: recover_olc
### Title: Recover Full Open Location Codes From Shortened Codes
### Aliases: recover_olc

### ** Examples

# Shorten an OLC and then recover the nearest full code. Note the actual characters differ.
shortened_code <- shorten_olc("8FVC9G8F+6X", 47.5, 8.5);
recovered_code <- recover_olc(shortened_code, 47.4, 8.6);




