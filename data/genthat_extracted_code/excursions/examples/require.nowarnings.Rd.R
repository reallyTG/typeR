library(excursions)


### Name: require.nowarnings
### Title: Warnings free loading of add-on packages
### Aliases: require.nowarnings

### ** Examples

## This should produce no output:
if (require.nowarnings(nonexistent)) {
message("Package loaded successfully")
}



