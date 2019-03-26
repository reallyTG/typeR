library(PieceExpIntensity)


### Name: PieceExpIntensity
### Title: Runs the PieceExpIntensity sampler and returns posterior
###   results.
### Aliases: PieceExpIntensity

### ** Examples

B=1000
n=100
X=rexp(n,1)
Y=X
Y[X<.5]=rpois(sum(X<.5),20)
Y[X>.5]=rpois(sum(X>.5),3)
Poi=10
PieceExpIntensity(X,Y,B,Poi)



