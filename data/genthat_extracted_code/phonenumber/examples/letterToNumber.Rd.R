library(phonenumber)


### Name: letterToNumber
### Title: Convert letters to numbers as on a telephone's keypad
### Aliases: letterToNumber

### ** Examples

# Convert an alphabetic string can be converted directly (with
# non-alphanumeric characters replaced by dashes)

letterToNumber("R functions") # returns "7-386284667"

# Of course, vectors containing strings can also be converted

string <- "Phone Number"
letterToNumber(string) # returns "74663-686237"

# Alphanumeric strings can also be converted with numbers being returned as
# is

letterToNumber("Jenny's number is 867-5309") # returns "53669-7-686237-47-867-5309"

# Specifying qz = 0 maps "q" and "z" to 0 instead of 7 and 9

letterToNumber("qz") # returns "79"
letterToNumber("qz", qz = 0) # returns ("00")



