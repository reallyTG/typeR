library(svMisc)


### Name: parse_text
### Title: Parse a character string as if it was a command entered at the
###   command line
### Aliases: parse_text parseText
### Keywords: IO

### ** Examples

parse_text("1 + 1")
parse_text("1 + 1; log(10)")
parse_text(c("1 + 1", "log(10)"))

# Incomplete instruction
parse_text("log(")

# Incomplete strings
parse_text("text <- \"some string")
parse_text("text <- 'some string")

# Incomplete names (don't write backtick quoted names on several lines!)
# ...but just in case
parse_text("`myvar")

# Incorrect expression
parse_text("log)")



