library(QFRM)


### Name: BarrierLT
### Title: Barrrier option valuation via lattice tree (LT)
### Aliases: BarrierLT

### ** Examples

# default Up and Knock-in Call Option with H=60, approximately 7.09
(o = BarrierLT())$PxLT

#Visualization of price changes as Nsteps change.
o = Opt(Style="Barrier")
visual=sapply(10:200,function(n) BarrierLT(OptPx(o,NSteps=n))$PxLT)

c=(10:200)
plot(visual~c,type="l",xlab="NSteps",ylab="Price",main="Price converence with NSteps")

# Down and Knock-out Call Option with H=40
o = OptPx(o=Opt(Style="Barrier"))
BarrierLT(o,dir="Down",knock="Out",H=40)

# Down and Knock-in Call Option with H=40
o = OptPx(o=Opt(Style="Barrier"))
BarrierLT(o,dir="Down",knock="In",H=40)

# Up and Knock-out Call Option with H=60
o = OptPx(o=Opt(Style="Barrier"))
BarrierLT(o,dir='Up',knock="Out")

# Down and Knock-out Put Option with H=40
o = OptPx(o=Opt(Style="Barrier",Right="Put"))
BarrierLT(o,dir="Down",knock="Out",H=40)

# Down and Knock-in Put Option with H=40
o = OptPx(o=Opt(Style="Barrier",Right="Put"))
BarrierLT(o,dir="Down",knock="In",H=40)

# Up and Knock-out Put Option with H=60
o = OptPx(o=Opt(Style="Barrier",Right="Put"))
BarrierLT(o,dir='Up',knock="Out")

# Up and Knock-in Put Option with H=60
BarrierLT(OptPx(o=Opt(Style="Barrier",Right="Put")))



