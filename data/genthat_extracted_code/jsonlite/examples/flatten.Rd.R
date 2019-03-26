library(jsonlite)


### Name: flatten
### Title: Flatten nested data frames
### Aliases: flatten

### ** Examples

options(stringsAsFactors=FALSE)
x <- data.frame(driver = c("Bowser", "Peach"), occupation = c("Koopa", "Princess"))
x$vehicle <- data.frame(model = c("Piranha Prowler", "Royal Racer"))
x$vehicle$stats <- data.frame(speed = c(55, 34), weight = c(67, 24), drift = c(35, 32))
str(x)
str(flatten(x))
str(flatten(x, recursive = FALSE))

## Not run: 
##D data1 <- fromJSON("https://api.github.com/users/hadley/repos")
##D colnames(data1)
##D colnames(data1$owner)
##D colnames(flatten(data1))
##D 
##D # or for short:
##D data2 <- fromJSON("https://api.github.com/users/hadley/repos", flatten = TRUE)
##D colnames(data2)
## End(Not run)




