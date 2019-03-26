library(mixtox)


### Name: NOEC
### Title: NOEC and LOEC Calculation
### Aliases: NOEC
### Keywords: NOEC LOEC

### ** Examples

## example 1
# calcualte the NOEC and LOEC of heavy metal Ni(2+) on the MCF-7 cells at the default significance 
# level of 0.05
x <- cytotox$Ni$x
rspn <- cytotox$Ni$y
NOEC(x, rspn)

## example 2
# calcualte the NOEC and LOEC of Neomycin sulfate on the phtotobacteria at the significance 
# level of 0.01
x <- antibiotox$NEO$x
rspn <- antibiotox$NEO$y
NOEC(x, rspn, sigLev = 0.01)



