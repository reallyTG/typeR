library(QFRM)


### Name: BinaryMC
### Title: Binary option valuation via Monte-Carlo (via) simulation.
### Aliases: BinaryMC

### ** Examples

(o = BinaryMC())$PxMC

o = OptPx(Opt(Style="Binary"))
(o = BinaryMC(o, Type="cash"))$PxMC

o = OptPx(Opt(Style="Binary"),q=0.01)
(o = BinaryMC(o, Type="asset"))$PxMC

o = OptPx(Opt(Style="Binary", S0=100, K=80),q=0.01)
(o = BinaryMC(o, Type="cash"))$PxMC

o = OptPx(Opt(Style="Binary", Right="Put", S0=50, K=60),q=0.04)
(o = BinaryMC(o, Type="asset"))$PxMC



