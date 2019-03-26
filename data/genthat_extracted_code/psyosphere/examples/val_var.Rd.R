library(psyosphere)


### Name: val_var
### Title: Validate variables
### Aliases: val_var

### ** Examples

# Create variables
id <- 10
name <- "test"
time <- as.POSIXct("1986-08-31 02:15:00")

# Check variables
# e <- val_var(id, "character"); if (e != "") {stop(e)} # error and stop
# e <- val_var(name, "logical", FALSE); if (e != "") {stop(e)} # error and warning
e <- val_var(time, "POSIXct"); if (e != "") {stop(e)} # no error




