library(RPMG)


### Name: jpng
### Title: png or pdf output
### Aliases: jpng jpdf
### Keywords: misc

### ** Examples


jjj = local.file('hi', 'eps')
x= rnorm(10)
y= rnorm(10)

plot(x,y)

print('resize the current plot')

jpostscript(jjj)
plot(x,y)
dev.off()

jpostscript("HiThere", P=c(7,7) )
plot(x,y)
dev.off()


jpostscript("HiThere", P=c(7,7), w=10 )
plot(x,y)
dev.off()







