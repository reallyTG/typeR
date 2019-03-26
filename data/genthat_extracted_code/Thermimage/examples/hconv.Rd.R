library(Thermimage)


### Name: hconv
### Title: Convective heat coefficient (W/m2/oC)
### Aliases: hconv

### ** Examples


## The function is currently defined as
function (Ts=30, Ta = 20, V = 1, L = 0.1, c = NULL, n = NULL, a = NULL, b = NULL, 
    m = NULL, type = "forced", shape="hcylinder") 
{
    if (V == 0) 
        type <- "free"
    if (type == "forced" | type == "Forced") 
        Nu <- Nusseltforced(c = c, n = n, V = V, L = L, Ta = Ta, shape="hcylinder")
    if (type == "free" | type == "Free") 
        Nu <- Nusseltfree(a = a, b = b, m = m, L = L, Ts = Ts, Ta = Ta, shape="hcylinder")
    k <- airtconductivity(Ta)
    hconv <- Nu * k/L
    hconv
  }
  




