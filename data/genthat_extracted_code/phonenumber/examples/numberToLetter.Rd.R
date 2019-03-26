library(phonenumber)


### Name: numberToLetter
### Title: Convert numbers to letters as on a telephone's keypad
### Aliases: numberToLetter

### ** Examples

# Convert a string or a vector of numeric characters

numberToLetter("911") # returns "W11" "X11" "Y11" "Z11"
x <- "911"
numberToLetter(x) # also returns "W11" "X11" "Y11" "Z11"

# Convert a number directly

numberToLetter(911) # also returns "W11" "X11" "Y11" "Z11"

# Convert an alphanumeric string (letters are returned as is and
# non-alphanumeric characters are returned as dashes)

numberToLetter("dial 911!") # returns "DIAL-W11-" "DIAL-X11-" "DIAL-Y11-" "DIAL-Z11-"

# Specifying qz = 0 maps "q" and "z" to 0 instead of 7 and 9

numberToLetter("000") # returns "000"
numberToLetter("000", qz = 0) # returns "QQQ" "QQZ" "QZQ" "QZZ" "ZQQ" "ZQZ" "ZZQ" "ZZZ"



