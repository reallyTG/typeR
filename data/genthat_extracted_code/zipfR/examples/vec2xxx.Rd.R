library(zipfR)


### Name: vec2xxx
### Title: Type-Token Statistics for Samples and Empirical Data (zipfR)
### Aliases: vec2tfl vec2spc vec2vgc
### Keywords: manip

### ** Examples


## type-token statistics for random samples from a LNRE distribution

model <- lnre("fzm", alpha=.5, A=1e-6, B=.05)
x <- rlnre(model, 100000)

vec2tfl(x)
vec2spc(x)  # same as tfl2spc(vec2tfl(x))
vec2vgc(x)

sample.spc <- vec2spc(x)
exp.spc <- lnre.spc(model, 100000)
## Not run:  plot(exp.spc, sample.spc) 

sample.vgc <- vec2vgc(x, m.max=1, steps=500)
exp.vgc <- lnre.vgc(model, N=N(sample.vgc), m.max=1)
## Not run:  plot(exp.vgc, sample.vgc, add.m=1) 


## load token vector from a file in one-token-per-line format

## Not run:  x <- readLines(filename) 
## Not run:  x <- readLines(file.choose()) # with file selection dialog  

## you can also perform whitespace tokenization and filter the data

## Not run:  brown <- scan("brown.pos", what=character(0), quote="") 
## Not run:  nouns <- grep("/NNS?$", brown, value=TRUE) 
## Not run:  plot(vec2spc(nouns)) 
## Not run:  plot(vec2vgc(nouns, m.max=1), add.m=1) 




