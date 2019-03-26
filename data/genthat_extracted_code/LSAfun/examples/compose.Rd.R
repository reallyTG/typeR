library(LSAfun)


### Name: compose
### Title: Two-Word Composition
### Aliases: compose

### ** Examples
data(wonderland)

compose(x="mad",y="hatter",method="Add",tvectors=wonderland)

compose(x="mad",y="hatter",method="Combined",a=1,b=2,c=3,
tvectors=wonderland)

compose(x="mad",y="hatter",method="Predication",m=20,k=3,
tvectors=wonderland)

compose(x="mad",y="hatter",method="Dilation",lambda=3,
tvectors=wonderland)


