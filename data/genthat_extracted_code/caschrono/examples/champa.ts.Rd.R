library(caschrono)


### Name: champa.ts
### Title: Monthly shipments of bottles of champagne for the period
###   2001-2010
### Aliases: champa.ts
### Keywords: datasets

### ** Examples

data("champa.ts")
# The executed code is : 
## Not run: 
aa <- scan(system.file("/import/champagne_2001.txt", package = "caschrono"))
champa.ts <- ts(aa/1000, start = c(2001,1), frequency = 12)
## End(Not run)



