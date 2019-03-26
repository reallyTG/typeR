library(kutils)


### Name: stringbreak
### Title: Insert "\n" after the k'th character in a string. This IS
###   vectorized, so can receive just one or many character strings in a
###   vector.
### Aliases: stringbreak

### ** Examples

x <- "abcdef ghijkl mnopqrs tuvwxyz abc def ghi jkl mno pqr stv"
stringbreak(x, 10)
stringbreak(x, 20)
stringbreak(x, 25)
x <- c("asdf asdfjl asfdjkl asdfjklasdfasd", "qrweqwer qwerqwerjklqw erjqwe")
stringbreak(x, 5)



