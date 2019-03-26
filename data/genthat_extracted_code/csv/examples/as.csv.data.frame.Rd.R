library(csv)


### Name: as.csv.data.frame
### Title: Save a Data Frame as CSV.
### Aliases: as.csv.data.frame

### ** Examples

x <- data.frame(
  check.names = FALSE,
  person = 1:3, 
  `name, suffix` = c("Bill Smith", 'Joseph "Joe" Hancock', "Mary Laguire, DDS")
)
file <- tempfile()
as.csv(x,file)
y <- as.csv(file,as.is=FALSE)
attr(y,'source')
attr(y,'source') <- NULL
x
y
stopifnot(identical(x,y))



