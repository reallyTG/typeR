library(epicontacts)


### Name: make_epicontacts
### Title: Read linelist and contact data
### Aliases: make_epicontacts epicontacts

### ** Examples

if (require(outbreaks)) {
## make epicontacts object from simulated Ebola data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts)

## test reordering of columns
linelist <- ebola_sim$linelist[,rev(seq_len(ncol(ebola_sim$linelist)))]
contacts <- ebola_sim$contacts[,rev(seq_len(ncol(ebola_sim$contacts)))]
head(linelist)
head(contacts)

## make object
x <- make_epicontacts(linelist, contacts, id = "case_id",
                       to = "case_id", from = "infector")
head(x$linelist)
head(x$contacts)
}



