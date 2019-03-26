library(customLayout)


### Name: lay_set
### Title: Set custom layout.
### Aliases: lay_set laySet

### ** Examples


lplots = lay_new(matrix(1:2))
lpie   = lay_new(1)
lay = lay_bind_col(lplots,lpie)
lay_set(lay)
plot(1:10)
plot(1:10)
plot(1:20)




