library(zipfR)


### Name: N-V-Vm
### Title: Access Methods for Observed Frequency Data (zipfR)
### Aliases: N V Vm
### Keywords: methods manip

### ** Examples


## load Brown spc and tfl
data(Brown.spc)
data(Brown.tfl)

## you can extract N, V and Vm (for a specific m)
## from either structure
N(Brown.spc)
N(Brown.tfl)

V(Brown.spc)
V(Brown.tfl)

Vm(Brown.spc,1)
Vm(Brown.tfl,1)

## you can extract the same info also from a lnre model estimated
## from these data (NB: these are the observed quantities; for the
## expected values predicted by the model use EV and EVm instead!)
model <- lnre("gigp",Brown.spc)
N(model)
V(model)
Vm(model,1)

## Baayen's P:
Vm(Brown.spc,1)/N(Brown.spc)

## when input is a spectrum (and only then) you can specify a vector
## of m's; e.g., to obtain class sizes of first 5 spectrum elements
## you can write:
Vm(Brown.spc,1:5)

## the Brown vgc
data(Brown.emp.vgc)

## with a vgc as input, N, V and Vm return vectors of the respective
## values for each sample size listed in the vgc
Ns <- N(Brown.emp.vgc)
Vs <- V(Brown.emp.vgc)
V1s <- Vm(Brown.emp.vgc,1)

head(Ns)
head(Vs)
head(V1s)

## since the last sample size in Brown.emp.vgc
## corresponds to the full Brown, the last elements
## of the Ns, Vs and V1s vectors are the same as
## the quantities extracted from the spectrum and
## tfl:
Ns[length(Ns)]
Vs[length(Vs)]
V1s[length(V1s)]




