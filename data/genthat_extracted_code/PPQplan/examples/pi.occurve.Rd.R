library(PPQplan)


### Name: pi.occurve
### Title: Operating Characteristic (OC) Curves for the CQA PPQ Plan using
###   Prediction Interval.
### Aliases: pi.occurve

### ** Examples

pi.occurve(attr.name = "Total Protein", attr.unit = "mg/mL",
sigma = seq(0.01,1,0.01))
pi.occurve(attr.name = "Total Protein", attr.unit = "mg/mL",
sigma = seq(0.01,1,0.01), n.batch=3)
# Baseline curve
pi.occurve(attr.name = "Total Protein", attr.unit = "mg/mL",
sigma = seq(0.01,1,0.01), alpha = 0.1135434)
# High performance curve
pi.occurve(attr.name = "Total Protein", attr.unit = "mg/mL",
sigma = seq(0.01,1,0.01), alpha = 0.0225518)

# 95% with reference curves
pi.occurve(attr.name = "Total Protein", attr.unit = "mg/mL",
sigma = seq(0.01,1,0.01), add.reference=TRUE)
pi.occurve(attr.name = "Composite Assay", attr.unit = "%",
mu = 100, sigma = seq(0.1,6,0.1), Llim=95, Ulim=105, n.batch=1, add.reference=TRUE)

pi.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
mu=97, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

pi.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
mu=100, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

pi.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
mu=seq(95,105,0.1), sigma=1, Llim=95, Ulim=105, n=10, add.reference=TRUE)

pi.occurve(attr.name = "Protein Concentration", attr.unit="%",
mu=seq(90, 110, 0.1), sigma=1.25, Llim=90, Ulim=110, add.reference=TRUE)




