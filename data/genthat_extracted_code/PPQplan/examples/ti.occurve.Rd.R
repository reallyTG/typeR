library(PPQplan)


### Name: ti.occurve
### Title: Operating Characteristic (OC) Curves for the PPQ Plan using
###   Tolerance Interval.
### Aliases: ti.occurve

### ** Examples



ti.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
mu=97, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

ti.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
mu=100, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=3mL",
Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40,
alpha = 0.05, coverprob = 0.97, side=1, NV=3)

ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=3mL",
Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40,
alpha = 0.05, coverprob = 0.992, side=1, NV=3)





