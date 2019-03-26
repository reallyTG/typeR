library(taxa)


### Name: hierarchy
### Title: The Hierarchy class
### Aliases: hierarchy

### ** Examples

(x <- taxon(
  name = taxon_name("Poaceae"),
  rank = taxon_rank("family"),
  id = taxon_id(4479)
))

(y <- taxon(
  name = taxon_name("Poa"),
  rank = taxon_rank("genus"),
  id = taxon_id(4544)
))

(z <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
))

(res <- hierarchy(z, y, x))

res$taxa
res$ranklist

# pop off a rank
pop(res, ranks("family"))

# pick a rank
(res <- hierarchy(z, y, x))
pick(res, ranks("family"))


# null taxa
x <- taxon(NULL)
(res <- hierarchy(x, x, x))
## similar to hierarchy(), but `taxa` slot is not empty



