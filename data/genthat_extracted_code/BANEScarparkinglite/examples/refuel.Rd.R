library(BANEScarparkinglite)


### Name: refuel
### Title: Add new processed records from Bath: Hacked datastore
### Aliases: refuel

### ** Examples

## No test: 
raw_data <- get_all_crude()
df <- refine(get_all_crude)

# Some time later, add most recent records
df <- refuel(df)
## End(No test)



