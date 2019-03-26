library(nasapower)


### Name: create_met
### Title: Create an APSIM met File from POWER Data
### Aliases: create_met

### ** Examples

# Create a met file for Kingsthorpe, Qld
# from 1985-01-01 to 1985-06-30 and
# save it in the current R session
# tempdir() as APSIM_example.met

## No test: 
create_met(lonlat = c(151.81, -27.48),
           dates = c("1985-01-01", "1985-12-31"),
           dsn = tempdir(),
           file = "APSIM_example.met"
           )
## End(No test)




