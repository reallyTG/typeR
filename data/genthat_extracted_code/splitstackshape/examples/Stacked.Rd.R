library(splitstackshape)


### Name: Stacked
### Title: Stack Columns from a Wide Form to a Long Form
### Aliases: Stacked

### ** Examples


set.seed(1)
mydf <- data.frame(id_1 = 1:6, id_2 = c("A", "B"),
                   varA.1 = sample(letters, 6),
                   varA.2 = sample(letters, 6),
                   varA.3 = sample(letters, 6),
                   varB.2 = sample(10, 6),
                   varB.3 = sample(10, 6),
                   varC.3 = rnorm(6))
mydf
Stacked(data = mydf, var.stubs = c("varA", "varB", "varC"), sep = ".")

## Don't show: 
rm(mydf)
## End(Don't show)




