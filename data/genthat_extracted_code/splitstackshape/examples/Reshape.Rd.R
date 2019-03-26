library(splitstackshape)


### Name: Reshape
### Title: Reshape Wide Data Into a Semi-long Form
### Aliases: Reshape

### ** Examples


set.seed(1)
mydf <- data.frame(id_1 = 1:6, id_2 = c("A", "B"), varA.1 = sample(letters, 6),
                 varA.2 = sample(letters, 6), varA.3 = sample(letters, 6),
                 varB.2 = sample(10, 6), varB.3 = sample(10, 6),
                 varC.3 = rnorm(6))
mydf

## Note that these data are unbalanced
## reshape() will not work
## Not run: 
##D reshape(mydf, direction = "long", idvar=1:2, varying=3:ncol(mydf))
## End(Not run)

## The Reshape() function can handle such scenarios

Reshape(mydf, id.vars = c("id_1", "id_2"),
       var.stubs = c("varA", "varB", "varC"))




