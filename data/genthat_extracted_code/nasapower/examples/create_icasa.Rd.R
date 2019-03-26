library(nasapower)


### Name: create_icasa
### Title: Create a DSSAT ICASA File from POWER Data
### Aliases: create_icasa

### ** Examples

# Create an ICASA file for Kingsthorpe,
# Qld from 1985-01-01 to 1985-06-30
# and save it in the current R session
# tempdir() as ICASA_example.txt

## No test: 
create_icasa(lonlat = c(151.81, -27.48),
            dates = c("1985-01-01", "1985-12-31"),
            dsn = tempdir(),
            file = "ICASA_example.txt"
            )
## End(No test)




