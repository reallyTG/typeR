library(GEOmap)


### Name: NSarrow
### Title: North-South Weather Vane Arrow
### Aliases: NSarrow vane
### Keywords: misc

### ** Examples


plot(c(1:10), c(1:10), type='n')

x=c(2,2)
y = c(8,9)

NSarrow(list(x=x, y=y))

##### move over and repeat, with rotation of 25 degrees west

x=c(5,5)
y = c(8,9)

NSarrow(list(x=x, y=y), rot=25)







