library(plantecophys)


### Name: Photosyn
### Title: Coupled leaf gas exchange model
### Aliases: Photosyn Aci Aci

### ** Examples

# Run the coupled leaf gas exchange model, set only a couple of parameters
Photosyn(VPD=2, g1=4, Ca=500)

# It is easy to set multiple values for inputs (and these can be mixed with single inputs);
r <- Photosyn(VPD=seq(0.5, 4, length=25), Vcmax=50, Jmax=100)
with(r, plot(VPD, ALEAF, type='l'))

# Set the mesophyll conductance
run1 <- Photosyn(PPFD=seq(50,1000,length=25), gmeso=0.15, Vcmax=40, Jmax=85)
with(run1, plot(PPFD, GS, type='l'))

# Run A-Ci curve only (provide Ci instead of calculating it).
arun1 <- Aci(Ci=seq(50, 1200, length=101), Vcmax=40, Jmax=85)
arun2 <- Aci(Ci=seq(50, 1200, length=101), Vcmax=30, Jmax=70)
with(arun1, plot(Ci, ALEAF, type='l'))
with(arun2, points(Ci, ALEAF, type='l', lty=5))

# Find the intersection between supply of CO2 and demand for CO2 (cf. Farquhar and Sharkey 1982).

# Set some parameters
gs <- 0.2  # stomatal conductance to H2O
Ca <- 400  # ambient CO2
gctogw <- 1.57  # conversion
gc <- gs / gctogw  # stomatal conductance to CO2

# Demand curve (Farquhar model)
p <- Aci(seq(60,500,length=101), Ca=400)

# Provide stomatal conductance as input, gives intersection point.
g <- Photosyn(GS=gs, Ca=Ca)

# Intersection point visualized
par(yaxs="i")
with(p, plot(Ci, ALEAF, type='l', ylim=c(0,max(ALEAF))))
with(g, points(Ci, ALEAF, pch=19, col="red"))
abline(gc * Ca, -gc, lty=5)

legend("topleft", c(expression("Demand:"~~A==f(C[i])),
                    expression("Supply:"~~A==g[c]*(C[a]-C[i])),
                    "Operating point"),
       lty=c(1,5,-1),pch=c(-1,-1,19),
       col=c("black","black","red"),
       bty='n', cex=0.9)



