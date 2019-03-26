library(mkin)


### Name: mkinsub
### Title: Function to set up a kinetic submodel for one state variable
### Aliases: mkinsub

### ** Examples

# One parent compound, one metabolite, both single first order.
SFO_SFO <- mkinmod(
  parent = list(type = "SFO", to = "m1"),
  m1 = list(type = "SFO"))

# The same model using mkinsub
SFO_SFO.2 <- mkinmod(
  parent = mkinsub("SFO", "m1"),
  m1 = mkinsub("SFO"))

# Now supplying full names
SFO_SFO.2 <- mkinmod(
  parent = mkinsub("SFO", "m1", full_name = "Test compound"),
  m1 = mkinsub("SFO", full_name = "Metabolite M1"))



