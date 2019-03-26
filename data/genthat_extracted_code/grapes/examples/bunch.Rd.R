library(grapes)


### Name: bunch
### Title: Function 'bunch'
### Aliases: bunch

### ** Examples

grow(rbind, from = "base") 
bunch() # has "%rbind%"
myfun = function(x, y) x + y
env = new.env()
grow(myfun, to = env)
bunch() # has "%rbind%"
bunch(from = env) # "%myfun%"



