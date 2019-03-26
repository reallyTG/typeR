library(openintro)


### Name: email50
### Title: Sample of 50 emails
### Aliases: email50
### Keywords: datasets

### ** Examples

data(email50)
data(email)
set.seed(5)
d  <- email[sample(nrow(email), 50),][c(1:25,27:50,26),]
identical(d, email50)

# the "[c(1,26,2:25,27:50),]" was added to reorder the cases



