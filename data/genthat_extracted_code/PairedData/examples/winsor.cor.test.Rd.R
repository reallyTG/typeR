library(PairedData)


### Name: winsor.cor.test
### Title: Winsorized correlation test (for paired data)
### Aliases: winsor.cor.test winsor.cor.test.default winsor.cor.test.paired

### ** Examples

data(PrisonStress)
with(PrisonStress,winsor.cor.test(PSSbefore,PSSafter))
with(PrisonStress,winsor.cor.test(paired(PSSbefore,PSSafter)))



