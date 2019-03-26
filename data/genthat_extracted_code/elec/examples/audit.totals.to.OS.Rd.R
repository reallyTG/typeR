library(elec)


### Name: audit.totals.to.OS
### Title: Converting total vote counts to Over Statements
### Aliases: audit.totals.to.OS

### ** Examples


## Generate a fake race, a fake audit, and then compute overstatements
Z = make.sample(0.08, 150, per.winner=0.4, R=2.01)
Z
Zb = make.ok.truth(Z, num.off=150, amount.off=5)
Zb
aud = Zb$V[ sample(1:Zb$N, 10), ]
aud
audit.totals.to.OS(Z, aud )



