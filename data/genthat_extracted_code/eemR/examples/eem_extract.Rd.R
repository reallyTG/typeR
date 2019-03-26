library(eemR)


### Name: eem_extract
### Title: Extract EEM samples
### Aliases: eem_extract

### ** Examples

folder <- system.file("extdata/cary/scans_day_1", package = "eemR")
eems <- eem_read(folder)

eems

# Remove first and third samples
eem_extract(eems, c(1, 3))

# Remove everything except first and third samples
eem_extract(eems, c(1, 3), keep = TRUE)

# Remove all samples containing "3" in their names.
eem_extract(eems, "3")

# Remove all samples containing either character "s" or character "2" in their names.
eem_extract(eems, c("s", "2"))

# Remove all samples containing "blank" or "nano"
eem_extract(eems, c("blank", "nano"))




