library(respirometry)


### Name: Q10
### Title: Parameters of Q10 Temperature Coefficient
### Aliases: Q10

### ** Examples

Q10(R1 = 5, R2 = 10, T1 = 10, T2 = 20) # Returns Q10; = 2
Q10(Q10 = 2.66, R1 = 5, T1 = 10, T2 = 20) # Returns R2; = 13.3

# My species has an MO2 of 9.5 umol/g/h at 10 *C. What MO2 should I expect at 13 *C?
Q10(Q10 = 2, R1 = 9.5, T1 = 10, T2 = 13) # expect ~11.7 umol/g/h at 13 *C.

# I measured MO2 at a spectrum of temperatures. What Q10 value best fits my data?
Q10(R_vec = c(1, 2, 5, NA, 18, 33), T_vec = c(0, 10, 20, 30, 40, 50))

# I want to see a plot of my data with a Q10 curve through them.
T_vec = c(5, 13, 13, 20, 27) # dummy data
R_vec = c(1, 3, 4, 9, 20)
curve_x = data.frame(T_vec = seq(5, 30, by = 0.01))
best_fit = Q10(R_vec = R_vec, T_vec = T_vec, model = TRUE)$model
curve_y = predict(best_fit, newdata = curve_x)
plot(T_vec, R_vec)
lines(curve_x$T_vec, curve_y)

# A 100 g individual at 10 *C has an MO2 of 1270 umol/h. How much
# would a 250 g individual likely consume at 14 *C?
Q10(Q10 = 2, R1 = scale_MO2(mass_1 = 100, MO2_1 = 1270, mass_2 = 250), T1 = 10, T2 = 14)

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




