library(stsm)


### Name: datagen.stsm
### Title: Generate Data from a Structural Time Series Model
### Aliases: datagen.stsm
### Keywords: ts

### ** Examples

# generate a quarterly series from a local level plus seasonal model
# the data set 'llmseas' is generated as follows (first series)
pars <- c(var1 = 300, var2 = 10, var3 = 100)
m <- stsm.model(model = "llm+seas", y = ts(seq(120), frequency = 4), 
  pars = pars, nopars = NULL)
ss <- char2numeric(m)
set.seed(123)
y <- datagen.stsm(n = 120, model = list(Z = ss$Z, T = ss$T, H = ss$H, Q = ss$Q), 
  n0 = 20, freq = 4, old.version = TRUE)$data

data("llmseas")
all.equal(y, llmseas)



