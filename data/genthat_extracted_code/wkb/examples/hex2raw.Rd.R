library(wkb)


### Name: hex2raw
### Title: Convert String Hex Representation to Raw Vector
### Aliases: hex2raw

### ** Examples

# create a character string containing a hexadecimal representation
hex <- "0101000000000000000000f03f0000000000000840"

# convert to raw vector
wkb <- hex2raw(hex)


# create a character vector containing a hexadecimal representation
hex <- c("01", "01", "00", "00", "00", "00", "00", "00", "00", "00", "00",
         "f0", "3f", "00", "00", "00", "00", "00", "00", "08", "40")

# convert to raw vector
wkb <- hex2raw(hex)


# create vector of two character strings each containing a hex representation
hex <- c("0101000000000000000000f03f0000000000000840",
         "010100000000000000000000400000000000000040")

# convert to list of two raw vectors
wkb <- hex2raw(hex)



