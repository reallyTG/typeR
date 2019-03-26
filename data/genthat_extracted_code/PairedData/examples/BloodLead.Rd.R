library(PairedData)


### Name: BloodLead
### Title: Blood lead levels data from Pruzek & Helmreich (2009)
### Aliases: BloodLead
### Keywords: datasets

### ** Examples

data(BloodLead)

# Control values are clealy less dispersed (and inferior)
# than exposed levels
with(BloodLead,plot(paired(Control,Exposed),type="McNeil"))
with(BloodLead,Var.test(paired(Control,Exposed)))

with(BloodLead,grambsch.Var.test(paired(Control,Exposed)))
with(BloodLead,bonettseier.Var.test(paired(Control,Exposed)))

# Correlation is small (bad matching)
with(BloodLead,cor.test(Control,Exposed))
with(BloodLead,winsor.cor.test(Control,Exposed))



