library(postlogic)


### Name: if-otherwise
### Title: Postfix if-otherwise logic
### Aliases: if-otherwise %if% %otherwise%

### ** Examples

    x <- 1
    x <- (x+1) %if% is.numeric(x) %otherwise% "Hmm this isn't right O.o"
    x # 2

    x <- 1i
    x <- (x+1) %if% is.numeric(x) %otherwise% "Hmm this isn't right O.o"
    x # Hmm this isn't right



