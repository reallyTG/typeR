library(feisr)


### Name: slopes
### Title: Extract individual slopes
### Aliases: slopes

### ** Examples

data("Produc", package = "plm")
feis.mod <- feis("log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp | year",
                 data = Produc, id = "state", robust = TRUE)
slps <- slopes(feis.mod)



