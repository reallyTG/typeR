library(flifo)


### Name: pop
### Title: Retrieve an object from a stack
### Aliases: pop

### ** Examples

(s <- lifo(max_length = 3)) # empty LIFO
(push(s, 0.3)) #
(push(s, data.frame(x=1:2, y=2:3))) 
obj <- pop(s) # get the last element inserted




