library(NSM3)


### Name: pSkilMack
### Title: Skillings-Mack
### Aliases: pSkilMack
### Keywords: Skillings-Mack

### ** Examples

##Hollander, Wolfe, Chicken Example 7.8 Effect of Rhythmicity of a Metronome on Speech Fluency
rhythmicity<-matrix(c(3, 5, 15, 1, 3, 18, 5, 4, 21, 2, NA, 6, 0, 2, 17, 0, 2, 10, 0, 3, 8,
0, 2, 13),ncol=3,byrow=TRUE)
#pSkilMack(rhythmicity)
pSkilMack(rhythmicity,n.mc=5000)



