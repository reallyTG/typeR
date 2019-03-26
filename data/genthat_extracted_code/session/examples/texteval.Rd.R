library(session)


### Name: texteval
### Title: Evaluate string(s) containing R commands and return the text
###   transcript or printed results
### Aliases: capture texteval printed
### Keywords: data programming

### ** Examples


# define a script string
script <- "x <- rnorm(100)\ny <- x + rnorm(100,0.25)\nsummary(lm(y~x))"

# evaluate the script string, returning a transcript.
result <- texteval(script, "\n")
cat(result)

# evaluate the script string, returning the printed output.
result <- printed(script, "\n")
cat(result)




