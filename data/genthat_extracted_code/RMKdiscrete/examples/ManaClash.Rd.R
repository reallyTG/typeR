library(RMKdiscrete)


### Name: ManaClash
### Title: The Mana Clash distributions (just for fun!)
### Aliases: ManaClash dmanaclash.net dmanaclash.dmg dmanaclash.xyN
###   rmanaclash

### ** Examples

## Same outcome, with and without conditioning on N:
dmanaclash.dmg(x=1,y=1,N=1)
dmanaclash.dmg(x=1,y=1)

## Same damage amounts, with N fixed versus random:
dmanaclash.dmg(x=1,y=1,N=2)
dmanaclash.xyN(x=1,y=1,N=2)

## Net damage distribution is symmetric with defaults:
dmanaclash.net(z=c(-3,-2,-1,0,1,2,3))
## But if coins are biased against opponent...:
dmanaclash.net(z=c(-3,-2,-1,0,1,2,3),pA=0.1,pB=0.1,pC=0.7,pD=0.1)

## Random draws:
rmanaclash(n=10)
rmanaclash(n=10,pA=0.1,pB=0.1,pC=0.7,pD=0.1)
rmanaclash(n=10,N=5)



