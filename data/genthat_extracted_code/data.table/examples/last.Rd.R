library(data.table)


### Name: last
### Title: Last item of an object
### Aliases: last
### Keywords: data

### ** Examples

last(1:5) # [1] 5
x = data.table(x=1:5, y=6:10)
last(x) # same as x[5]



