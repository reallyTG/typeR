library(Amelia)


### Name: moPrep
### Title: Prepare Multiple Overimputation Settings
### Aliases: moPrep moPrep.molist moPrep.default

### ** Examples

data(africa)
m.out <- moPrep(africa, trade ~ trade, error.proportion = 0.1)
a.out <- amelia(m.out, ts = "year", cs = "country")
plot(a.out)

m.out <- moPrep(africa, trade ~ trade, error.sd = 1)
a.out <- amelia(m.out, ts = "year", cs = "country")



