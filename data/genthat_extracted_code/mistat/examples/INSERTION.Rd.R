library(mistat)


### Name: INSERTION
### Title: Components Insertions into a Board
### Aliases: INSERTION
### Keywords: datasets

### ** Examples

data(INSERTION)

barplot(INSERTION$fail / 
          (INSERTION$fail + INSERTION$succ) * 
          100, 
        names.arg=INSERTION$comp, 
        ylab= "Percentage")
        



