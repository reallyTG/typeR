library(marelac)


### Name: sw_dens
### Title: Density of Sea Water
### Aliases: sw_dens
### Keywords: misc

### ** Examples

# table 22 Feistel 2008
sw_dens(0, 0, 0)               #0.999843086e3
sw_dens(0, 79.85, 0)           #0.97188383e3   - deviates
sw_dens(0, 0,998.98675)        #0.104527796e4

# table 21 Feistel 2008
sw_dens(35.16504, 0, 0)        #0.10281072e4
sw_dens(100, 79.85, 0)         #0.102985888e4
sw_dens(35.16504, 0,998.98675) #0.10709264e4

sw_dens(35.7, 25.5, 102.3)     #1027.95249315662

S <- 0:40
plot(S, sw_dens(S = S, t = 4, method = "UNESCO"))

lines(S, sw_dens(S = S, t = 4, method = "Gibbs"), col = "red")

lines(S, sw_dens(S = S, t = 4, method = "Chen"), col = "blue")




