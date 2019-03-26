library(sweidnumbr)


### Name: format_pin
### Title: Formatting pin
### Aliases: format_pin

### ** Examples

x <- as.pin(fake_pins$pin[1:10])

# Separate elements with hyphens:
format_pin(x, "%Y-%m-%d-%N")


# Separate even further
format_pin(x, "%C-%y-%m-%d-%N")

# The special P-format for maximal readability
format_pin(x, "%P") 

# A custom representation
format_pin(x, "Borned %d of %B in %Y (a %A in week %U) with suffix no: %N")

# Extract only the year
format_pin(x, "%Y")



