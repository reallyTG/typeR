library(PPQplan)


### Name: PPQ.occurve
### Title: Operating Characteristic (OC) Curves for the CQA PPQ Plan Using
###   General Multiplier.
### Aliases: PPQ.occurve

### ** Examples

PPQ.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%", Llim=95, Ulim=105,
mu=97, sigma=seq(0.1, 10, 0.1), n=10, k=2.373, add.reference=TRUE)
PPQ.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%", Llim=95, Ulim=105,
mu=100, sigma=seq(0.1, 10, 0.1), n=10, k=2.373, add.reference=TRUE)
PPQ.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%", Llim=95, Ulim=105,
mu=seq(95,105,0.1), sigma=1, n=10, k=2.373)
PPQ.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%", Llim=95, Ulim=105,
mu=seq(95,105,0.1), sigma=1, n=10, k=2.373, add.reference=TRUE)

PPQ.occurve(attr.name = "Protein Concentration", attr.unit="%", Llim=90, Ulim=110,
mu=seq(90, 110, 0.1), sigma=1.25, k=2.373)



