library(gasfluxes)


### Name: selectfluxes
### Title: Select a flux estimate
### Aliases: selectfluxes

### ** Examples

## Not run: 
##D res <- gasfluxes(fluxMeas[1:499], 
##D                  .id = "serie", .V = "V", .A = "A",
##D                  .times = "time", .C = "C",
##D                  methods = c("linear", "robust linear", "HMR"), verbose = FALSE, plot = FALSE)
##D selectfluxes(res, "RF2011new")
##D res[method == "HMR", .N] #2
##D 
##D ### estimate f.detect by simulation ###
##D #ambient concentration:
##D C0 <- 320/1000 * 28 * 273.15 / 22.4 / (273.15 + 15) #mg N / m^3
##D #uncertainty of GC measurement:
##D sdGC <- 5/1000 * 28 * 273.15 / 22.4 / (273.15 + 15) #mg N / m^3 
##D #create simulated concentrations corresponding to 1 hour flux measurements with zero fluxes:
##D set.seed(42)
##D sim <- data.frame(t = seq(0, 1, length.out = 4), C = rnorm(4e3, mean = C0, sd = sdGC), 
##D                   id = rep(1:1e3, each = 4), A = 1, V = 0.52)
##D #fit HMR model:                  
##D simflux <- gasfluxes(sim, .id = "id", .times = "t", methods = c("HMR", "linear"), plot = FALSE) 
##D simflux[, f0 := HMR.f0]
##D simflux[is.na(f0), f0 := linear.f0]
##D #dection limit as 97.5 % quantile (95 % confidence):
##D f.detect <- simflux[, quantile(f0, 0.975)] #0.03 mg N / m^2 / h
##D 
##D # example using the kappa.max (ref. Hueppi et al., 2018) with a single t.meas value
##D t.meas <- max(fluxMeas$time[1:499]) #1
##D selectfluxes(res, "kappa.max", f.detect = f.detect, t.meas = t.meas)
##D res[method == "HMR", .N] # 11        
##D 
##D # example using the kappa.max with a vector for t.meas
##D t.meas <- fluxMeas[1:499][, max(time), by = serie][["V1"]]
##D selectfluxes(res, "kappa.max", f.detect = f.detect, t.meas = t.meas)
##D res[method == "HMR", .N] # 10                  
## End(Not run)




