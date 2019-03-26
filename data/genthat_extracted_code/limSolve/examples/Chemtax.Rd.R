library(limSolve)


### Name: Chemtax
### Title: An overdetermined linear inverse problem: estimating algal
###   composition based on pigment biomarkers.
### Aliases: Chemtax
### Keywords: datasets

### ** Examples

# 1. Graphical representation of the chemtax example input data
palette(rainbow(12, s = 0.6, v = 0.75))

mp     <- apply(Chemtax$Ratio, MARGIN = 2, max)
pstars <- rbind(t(t(Chemtax$Ratio)/mp) ,
                  sample = Chemtax$Field/max(Chemtax$Field))
stars(pstars, len = 0.9, key.loc = c(7.2, 1.7),scale=FALSE,ncol=4,
      main = "CHEMTAX pigment composition", draw.segments = TRUE,
      flip.labels=FALSE)

# 2. Estimating the algal composition of the field sample
Nx     <-nrow(Chemtax$Ratio)

# equations that have to be met exactly Ex=f: 
# sum of all fraction must be equal to 1.
EE <- rep(1, Nx)
FF <- 1

# inequalities, Gx>=h:
# all fractions must be positive numbers
GG <- diag(nrow = Nx)
HH <- rep(0, Nx)

# equations that must be reproduced as close as possible, Ax ~ b
# = the field data; the input ratio matrix and field data are rescaled
AA     <- Chemtax$Ratio/rowSums(Chemtax$Ratio)
BB     <- Chemtax$Field/sum(Chemtax$Field)

# 1. Solve with lsei method
X <- lsei(t(AA), BB, EE, FF, GG, HH)$X
(Sample <- data.frame(Algae = rownames(Chemtax$Ratio),
                      fraction = X))

# plot results
barplot(X, names = rownames(Chemtax$Ratio), col = heat.colors(8),
        cex.names = 0.8, main = "Chemtax example solved with lsei")

# 2. Bayesian sampling; 
# The standard deviation on the field data is assumed to be 0.01
# jump length not too large or NO solutions are found!
xs <- xsample(t(AA), BB, EE, FF, GG, HH, sdB = 0.01, jmp = 0.025)$X
pairs(xs, main= "Chemtax, Bayesian sample")



