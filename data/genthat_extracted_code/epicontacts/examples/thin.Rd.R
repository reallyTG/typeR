library(epicontacts)


### Name: thin
### Title: Thin data to retain matching linelist / contacts
### Aliases: thin

### ** Examples

if (require(outbreaks)) {
## build data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id = "case_id", to = "case_id", from = "infector",
                       directed = TRUE)

## keep contacts from a specific case '916d0a'
x <- x[j = "916d0a", contacts = "from"]

}



