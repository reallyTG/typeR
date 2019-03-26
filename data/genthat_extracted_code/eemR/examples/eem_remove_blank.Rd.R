library(eemR)


### Name: eem_remove_blank
### Title: Blank correction
### Aliases: eem_remove_blank

### ** Examples


## Example 1

# Open the fluorescence eem
file <- system.file("extdata/cary/scans_day_1", "sample1.csv", package = "eemR")
eem <- eem_read(file)

plot(eem)

# Open the blank eem
file <- system.file("extdata/cary/scans_day_1", "nano.csv", package = "eemR")
blank <- eem_read(file)

plot(blank)

# Remove the blank
eem <- eem_remove_blank(eem, blank)

plot(eem)

## Example 2

# Open the fluorescence eem
folder <- system.file("extdata/cary/scans_day_1", package = "eemR")
eems <- eem_read(folder)

plot(eems, which = 3)

# Open the blank eem
file <- system.file("extdata/cary/scans_day_1", "nano.csv", package = "eemR")
blank <- eem_read(file)

plot(blank)

# Remove the blank
eem <- eem_remove_blank(eems, blank)

plot(eems, which = 3)

# Automatic correction
folder <- system.file("extdata/cary/", package = "eemR")

# Look at the folder structure
list.files(folder, "*.csv", recursive = TRUE)

eems <- eem_read(folder, recursive = TRUE)
res <- eem_remove_blank(eems)



