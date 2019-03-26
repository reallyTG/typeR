library(textclean)


### Name: replace_non_ascii
### Title: Replace Common Non-ASCII Characters
### Aliases: replace_non_ascii replace_curly_quote
### Keywords: ascii

### ** Examples

x <- c(
    "Hello World", "6 Ekstr\xf8m", "J\xf6reskog", "bi\xdfchen Z\xfcrcher",
    'This is a \xA9 but not a \xAE', '6 \xF7 2 = 3', 
    'fractions \xBC, \xBD, \xBE', 'cows go \xB5', '30\xA2'
)
Encoding(x) <- "latin1"
x

replace_non_ascii(x)
replace_non_ascii(x, remove.nonconverted = FALSE)

z <- '\x95He said, \x93Gross, I am going to!\x94'
Encoding(z) <- "latin1"
z

replace_curly_quote(z)
replace_non_ascii(z)



