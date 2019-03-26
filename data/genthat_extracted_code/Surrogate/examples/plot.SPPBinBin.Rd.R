library(Surrogate)


### Name: plot SPF BinBin
### Title: Plots the surrogate predictive function (SPF) in the
###   binary-binary settinf.
### Aliases: 'plot SPF BinBin' plot.SPF.BinBin
### Keywords: Plot SPF Causal-Inference framework Sensitivity

### ** Examples

# Generate plausible values for Pi  
ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.341, pi0_1_=0.119,
pi1_0_=0.254, pi_1_1=0.686, pi_1_0=0.088, pi_0_1=0.078, Seed=1,
Monotonicity=c("General"), M=2500)
           
# Compute the surrogate predictive function (SPF)
SPF <- SPF.BinBin(ICA)

# Explore the results
summary(SPF)

# Examples of plots 
plot(SPF, Type="All.Histograms")
plot(SPF, Type="All.Densities")
plot(SPF, Type="Histogram", Specific.Pi="r_0_0")
plot(SPF, Type="Box.Plot", Legend.Pos="topleft", Legend.Cex=.7)
plot(SPF, Type="Lines.Mean")
plot(SPF, Type="Lines.Median")
plot(SPF, Type="3D.Mean")
plot(SPF, Type="3D.Median")
plot(SPF, Type="3D.Spinning.Mean")
plot(SPF, Type="3D.Spinning.Median")



