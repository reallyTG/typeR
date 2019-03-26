library(tikzDevice)


### Name: sanitizeTexString
### Title: Replace LaTeX Special Characters in a String
### Aliases: sanitizeTexString
### Keywords: character

### ** Examples


# Be careful with sanitizing, it may lead to unexpected behavior.
# For example, we may want -1 to be a superscript it gets
# sanitized away with the other default special characters.
# The string appears in LaTeX exactly as shown.
## Not run: 
##D   sanitizeTexString('10% of 10$ is 10^{-1\}$')
## End(Not run)




