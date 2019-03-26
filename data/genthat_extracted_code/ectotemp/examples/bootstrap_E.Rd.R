library(ectotemp)


### Name: bootstrap_E
### Title: Bootstrap thermoregulation effectiveness
### Aliases: bootstrap_E

### ** Examples

te <- na.omit(bufbuf[,"te"])
tb <- na.omit(bufbuf[,"tb"])
E_bootstrapped <- bootstrap_E(te, tb,
                             19.35, 26.44,
                             'hertz',
                             1000)




