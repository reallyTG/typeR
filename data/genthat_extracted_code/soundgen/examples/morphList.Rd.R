library(soundgen)


### Name: morphList
### Title: Morph lists
### Aliases: morphList
### Keywords: internal

### ** Examples

l1 = list(f1 = data.frame(time = c(0, .5, 1),
                          freq = c(700, 900, 1200),
                          amp = c(30), width = c(80)),
          f2 = data.frame(time = c(0),
                          freq = c(900),
                          amp = c(30),
                          width = c(120)),
          f3 = data.frame(time = c(0),
                          freq = c(1500),
                          amp = c(20),
                          width = c(150)))
l2 = list(f1 = data.frame(time = c(0),
                          freq = c(400),
                          amp = c(40),
                          width = c(120)),
          f2 = data.frame(time = c(0, 1),
                          freq = c(1500, 2000),
                          amp = c(30),
                          width = c(150)))
ml = soundgen:::morphList(l1, l2, 4)



