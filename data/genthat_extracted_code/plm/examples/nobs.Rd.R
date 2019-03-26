library(plm)


### Name: nobs
### Title: Extract Total Number of Observations Used in Estimated
###   Panelmodel
### Aliases: nobs nobs.panelmodel
### Keywords: attribute

### ** Examples


# estimate a panelmodel
data("Produc", package = "plm")
z <- plm(log(gsp)~log(pcap)+log(pc)+log(emp)+unemp,data=Produc,
         model="random", subset = gsp > 5000)
         
nobs(z)       # total observations used in estimation
pdim(z)$nT$N  # same information
pdim(z)       # more information about the dimensions (no. of individuals and time periods)

# illustrate difference between nobs and pdim for first-difference model
data("Grunfeld", package = "plm")
fdmod <- plm(inv ~ value + capital, data = Grunfeld, model = "fd")
nobs(fdmod)      # 190
pdim(fdmod)$nT$N # 200



