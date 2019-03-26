library(scPDSI)


### Name: pdsi
### Title: Calculate the (sc)PDSI
### Aliases: pdsi

### ** Examples

library(scPDSI)
data(Lubuge)

P <- Lubuge$P
PE <- Lubuge$PE
sc_pdsi <- pdsi(P, PE, start = 1960)

plot(sc_pdsi) # plot PDSI
plot(sc_pdsi, index = "PHDI") # plot PHDI
plot(sc_pdsi, index = "WPLM") # plot weighted PDSI

# Without self-calibrating.
ori_pdsi <- pdsi(P, PE, start = 1960, sc = FALSE)
plot(ori_pdsi)

# Without self-calibrating and use standards of
# mainland China. (GB/T 20481-2017)
options(PDSI.coe.K1.1 = 1.6)
options(PDSI.coe.K1.3 = 0.4)
options(PDSI.coe.K2 = 16.84)
options(PDSI.p = 0.755)
options(PDSI.q = 1/1.63)
gb_pdsi <- pdsi(P, PE, start = 1960, sc = FALSE)
plot(gb_pdsi)




