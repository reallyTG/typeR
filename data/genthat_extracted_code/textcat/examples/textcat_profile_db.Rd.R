library(textcat)


### Name: textcat_profile_db
### Title: Textcat Profile Dbs
### Aliases: textcat_profile_db

### ** Examples

## Obtain the texts of the standard licenses shipped with R.
files <- dir(file.path(R.home("share"), "licenses"), "^[A-Z]",
             full.names = TRUE)
texts <- sapply(files,
                function(f) paste(readLines(f), collapse = "\n"))
names(texts) <- basename(files)
## Build a profile db using the same method and options as for building
## the ECIMCI character profiles.
profiles <- textcat_profile_db(texts, profiles = ECIMCI_profiles)
## Inspect the 10 most frequent n-grams in each profile.
lapply(profiles, head, 10L)
## Combine into one frequency table.
tab <- as.matrix(profiles)
tab[, 1 : 10]
## Determine languages.
textcat(profiles, ECIMCI_profiles)



