library(frmqa)


### Name: besselK_inc_clo
### Title: Exact Calculation of the Incomplete BesselK Function
### Aliases: besselK_inc_clo

### ** Examples

  options(digits = 15)	
  ## For x = 5, z = 8, lambda = 15/2 Maple 15 gives exact value of the
  ## lower incomplete Bessel function 0.997 761 151 460 5189(-4)
  besselK_inc_clo(5, 8, 15/2, lower = TRUE, expon.scaled = FALSE)
  ## For x = 21, z = 8, lambda = 21/2 Maple 15 give exact value of the
  ## upper incomplete Bessel function 0.704 812 324 921 884 3938(-2)
  besselK_inc_clo(21, 8, 21/2, lower = FALSE, expon.scaled = FALSE)



