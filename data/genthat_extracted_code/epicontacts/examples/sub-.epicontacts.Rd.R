library(epicontacts)


### Name: [.epicontacts
### Title: Subset epicontacts objects based on case identifiers
### Aliases: [.epicontacts

### ** Examples

if (require(outbreaks)) {
## build data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id = "case_id", to = "case_id", from = "infector",
                       directed = TRUE)

## subset first 10 linelist cases
x[1:10]

## same, remove contacts
x[1:10, j = FALSE]

## subset first 10 contacts
x[j = 1:10]

## remove the metadata
x[k = FALSE, j = FALSE]

## keep contacts where both cases are in linelist
x[j = get_id(x, "linelist"), contacts = "both"]

## keep contacts from a specific case '916d0a'
x[j = "916d0a", contacts = "from"]

## more complex: keep all cases and contacts with > 4 secondary contacts
## i) find cases to keep
temp <- table(x$contacts$from)
temp[temp > 4]
to.keep <- names(temp)[temp > 4]
to.keep

## subset the contacts
y <- x[j = to.keep, contacts = "either"]
y

## keep only relevant entries in the linelist
y <- thin(y)

## visualise result
plot(y)
}



