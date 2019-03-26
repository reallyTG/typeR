library(conf.design)


### Name: join
### Title: Amalgamate two or more factors.
### Aliases: join
### Keywords: design

### ** Examples

within(data.frame(f = gl(2, 3)), {
  g <- gl(3,2,length(f))
  fg <- join(f, g)
})
###   f  fg g
### 1 1 1:1 1
### 2 1 1:1 1
### 3 1 1:2 2
### 4 2 2:2 2
### 5 2 2:3 3
### 6 2 2:3 3



