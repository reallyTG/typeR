library(QFRM)


### Name: ChooserMC
### Title: Chooser option valuation via Monte Carlo (MC) simulations
### Aliases: ChooserMC

### ** Examples

(o = ChooserMC())$PxMC

o = OptPx(Opt(Right='Call',Style="Chooser"))
 ChooserMC(o,isEu=TRUE,NPaths=5, plot=TRUE)

 o = OptPx(Opt(Right='Put',Style="Chooser"))
 ChooserMC(o,isEu=TRUE,NPaths=5, plot=TRUE)

 o = Opt(Right='C',S0=100,K=110,ttm=4,Style="Chooser")
 o = OptPx(o,vol=0.2,r=0.05,q=0.04)
 ChooserMC(o,isEu=TRUE,T1=2,NPaths=5)

 o = Opt(Right='P',S0=110,K=100,ttm=4,Style="Chooser")
 o = OptPx(o,vol=0.2,r=0.05,q=0.04)
 ChooserMC(o,isEu=TRUE,T1=2,NPaths=5)

 o = Opt(Right='C',S0=50,K=50,ttm=0.5,Style="Ch")
 o = OptPx(o,vol=0.25,r=0.08,q=0.1)
 ChooserMC(o,isEu=FALSE,T1=0.25,NPaths=5)



