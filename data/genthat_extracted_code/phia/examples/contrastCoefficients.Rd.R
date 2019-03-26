library(phia)


### Name: contrastCoefficients
### Title: Calculate Coefficient Matrices of Factor Contrasts
### Aliases: contrastCoefficients

### ** Examples

# Calculate the coefficients of example(testInteractions)
# cntrl.vs.T1 <- list(therapy = c(1, -1, 0))
contrastCoefficients(therapy ~ control - T1, data = Boik)
# cntrl.vs.T2 <- list(therapy = c(1, 0, -1))
contrastCoefficients(therapy ~ control - T2, data = Boik)
# plcb.vs.doses <- list(medication = c(1, -1/3, -1/3, -1/3))
contrastCoefficients(medication ~ placebo - (D1+D2+D3)/3, data = Boik)
# Combine cntrl.vs.T1 and plcb.vs.doses
contrastCoefficients(
  therapy ~ control - T1, medication ~ placebo - (D1+D2+D3)/3, data = Boik)

# Put various contrasts of the same factor in a matrix, and normalize them
contrastCoefficients(
	therapy ~ control - T1,
	therapy ~ control - T2,
	medication ~ placebo - (D1+D2+D3)/3,
	data = Boik,
	normalize=TRUE)



