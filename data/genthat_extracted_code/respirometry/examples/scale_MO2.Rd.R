library(respirometry)


### Name: scale_MO2
### Title: Mass-correct metabolic rate
### Aliases: scale_MO2

### ** Examples

# I know a species has an SMR of 800 umol O2/h at 200 g.
# What would be a likely SMR for a 300 g individual?
scale_MO2(mass_1 = 200, MO2_1 = 800, mass_2 = 300)

# Some squids have a much higher scaling coefficient:
scale_MO2(mass_1 = 200, MO2_1 = 800, mass_2 = 300, b = 0.92)

# A 100 g individual at 10 *C has an MO2 of 1270 umol/h. How much
# would a 250 g individual likely consume at 14 *C?
Q10(Q10 = 2, R1 = scale_MO2(mass_1 = 100, MO2_1 = 1270, mass_2 = 250), T1 = 10, T2 = 14)

# Now I have data from real animals and I want to mass-correct them all to a 10 g animal.
mass = 2:20 # obviously not real but you get the point
mo2 = c(44.8, 41, 36, 35, 35, 33.5, 34.5, 40, 30, 23, 27, 30, 25.6, 27.8, 28, 24, 27, 28, 20)
desired_mass = 10

b = calc_b(mass = mass, MO2 = mo2)
scale_MO2(mass_1 = mass, MO2_1 = mo2, mass_2 = desired_mass, b = b)

plot(mass, mo2, ylab = 'Raw MO2') # before
plot(mass, scale_MO2(mass_1 = mass, MO2_1 = mo2, mass_2 = 10, b = b),
ylab = 'Mass-corrected MO2') # after


# Visualize MO2 scaling by mass and temperature:
mass <- seq(10, 200, 10)
temp <- 10:25
base_mass <- 50
base_temp <- 20
base_MO2 <- 750
mo2 <- outer(mass, temp, function(mass, temp){
	scale_MO2(mass_1 = base_mass, mass_2 = mass, MO2_1 = Q10(Q10 = 2, R1 = base_MO2,
	 T1 = base_temp, T2 = temp))
})
persp(mass, temp, mo2, xlab = 'Mass (g)', ylab = 'Temperature (*C)', zlab = 'MO2 (umol / hr)',
 theta = 35, phi = 15, expand = 0.5, ticktype = 'detailed', nticks = 10)




