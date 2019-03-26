library(HoRM)


### Name: hildreth.lu
### Title: Hildreth-Lu Procedure
### Aliases: hildreth.lu
### Keywords: file

### ** Examples
 
## Example using the natural gas dataset.

data(gas)

out.1 <- hildreth.lu(y = gas$OK, x = gas$LA, rho = 0.1)
out.2 <- hildreth.lu(y = gas$OK, x = gas$LA, rho = 0.5)

out.1
out.2




