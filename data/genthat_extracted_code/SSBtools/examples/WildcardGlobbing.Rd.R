library(SSBtools)


### Name: WildcardGlobbing
### Title: Row selection by wildcard/globbing
### Aliases: WildcardGlobbing

### ** Examples

# Create data input
data(precip)
data(mtcars)
x <- data.frame(car = rownames(mtcars)[rep(1:NROW(mtcars), each = 35)], city = names(precip), 
                stringsAsFactors = FALSE)

# Create globbing/wildcards input
wg <- data.frame(rbind(c("Merc*", "C*"), c("F*", "??????"), c("!?????????*", "!???????*")), 
                 stringsAsFactors = FALSE)
names(wg) <- names(x)

# Select the following combinations:
# - Cars starting with Merc and cities starting with C
# - Cars starting with F and six-letter cities 
# - Cars with less than nine letters and cities with less than seven letters
x[WildcardGlobbing(x, wg), ]



