## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
comment = "#>",
collapse = TRUE,
warning = FALSE,
message = FALSE,
eval = TRUE
)

## ----results='asis', echo = FALSE----------------------------------------
flowchart_path <- "class_diagram.png"
width <- 718
if (knitr:::child_mode()) { # if run as a child
  flowchart_path <- file.path("vignettes", flowchart_path)
}
cat(paste0('<img src="', flowchart_path, '" title="taxa classes diagram" width="',
       width, '">'))

## ----eval=FALSE----------------------------------------------------------
#  install.packages("taxa")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("ropensci/taxa")

## ------------------------------------------------------------------------
library("taxa")

## ------------------------------------------------------------------------
(ncbi <- taxon_database(
  name = "ncbi",
  url = "http://www.ncbi.nlm.nih.gov/taxonomy",
  description = "NCBI Taxonomy Database",
  id_regex = "*"
))
ncbi$name
ncbi$url

## ------------------------------------------------------------------------
database_list

## ------------------------------------------------------------------------
taxon_rank(name = "species", database = "ncbi")

## ------------------------------------------------------------------------
taxon_name("Poa", database = "ncbi")

## ------------------------------------------------------------------------
taxon_id(12345, database = "ncbi")

## ------------------------------------------------------------------------
(x <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036),
  authority = "Linnaeus"
))

## ------------------------------------------------------------------------
(x <- taxon(
  name = "Poa annua",
  rank = "species",
  id = 93036,
  authority = "Linnaeus"
))

## ------------------------------------------------------------------------
grass <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
)
mammalia <- taxon(
  name = taxon_name("Mammalia"),
  rank = taxon_rank("class"),
  id = taxon_id(9681)
)
plantae <- taxon(
  name = taxon_name("Plantae"),
  rank = taxon_rank("kingdom"),
  id = taxon_id(33090)
)

taxa(grass, mammalia, plantae)

## ------------------------------------------------------------------------
x <- taxon(
  name = taxon_name("Poaceae"),
  rank = taxon_rank("family"),
  id = taxon_id(4479)
)

y <- taxon(
  name = taxon_name("Poa"),
  rank = taxon_rank("genus"),
  id = taxon_id(4544)
)

z <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
)

(hier1 <- hierarchy(z, y, x))

## ------------------------------------------------------------------------
a <- taxon(
  name = taxon_name("Felidae"),
  rank = taxon_rank("family"),
  id = taxon_id(9681)
)
b <- taxon(
  name = taxon_name("Puma"),
  rank = taxon_rank("genus"),
  id = taxon_id(146712)
)
c <- taxon(
  name = taxon_name("Puma concolor"),
  rank = taxon_rank("species"),
  id = taxon_id(9696)
)
(hier2 <- hierarchy(c, b, a))

## ------------------------------------------------------------------------
hierarchies(hier1, hier2)

## ------------------------------------------------------------------------
# define taxa
notoryctidae <- taxon(name = "Notoryctidae", rank = "family", id = 4479)
notoryctes <- taxon(name = "Notoryctes", rank = "genus", id = 4544)
typhlops <- taxon(name = "typhlops", rank = "species", id = 93036)
mammalia <- taxon(name = "Mammalia", rank = "class", id = 9681)
felidae <- taxon(name = "Felidae", rank = "family", id = 9681)
felis <- taxon(name = "Felis", rank = "genus", id = 9682)
catus <- taxon(name = "catus", rank = "species", id = 9685)
panthera <- taxon(name = "Panthera", rank = "genus", id = 146712)
tigris <- taxon(name = "tigris", rank = "species", id = 9696)
plantae <- taxon(name = "Plantae", rank = "kingdom", id = 33090)
solanaceae <- taxon(name = "Solanaceae", rank = "family", id = 4070)
solanum <- taxon(name = "Solanum", rank = "genus", id = 4107)
lycopersicum <- taxon(name = "lycopersicum", rank = "species", id = 49274)
tuberosum <- taxon(name = "tuberosum", rank = "species", id = 4113)
homo <- taxon(name = "homo", rank = "genus", id = 9605)
sapiens <- taxon(name = "sapiens", rank = "species", id = 9606)
hominidae <- taxon(name = "Hominidae", rank = "family", id = 9604)

# define hierarchies
tiger <- hierarchy(mammalia, felidae, panthera, tigris)
cat <- hierarchy(mammalia, felidae, felis, catus)
human <- hierarchy(mammalia, hominidae, homo, sapiens)
mole <- hierarchy(mammalia, notoryctidae, notoryctes, typhlops)
tomato <- hierarchy(plantae, solanaceae, solanum, lycopersicum)
potato <- hierarchy(plantae, solanaceae, solanum, tuberosum)

# make taxonomy
(tax <- taxonomy(tiger, cat, human, tomato, potato))

## ------------------------------------------------------------------------
supertaxa(tax)

## ------------------------------------------------------------------------
supertaxa(tax, subset = "m")

## ------------------------------------------------------------------------
supertaxa(tax, subset = "m", value = "taxon_names")

## ------------------------------------------------------------------------
supertaxa(tax, subset = "m", value = "taxon_ranks")

## ------------------------------------------------------------------------
supertaxa(tax, subset = taxon_ranks == "genus", value = "taxon_ranks")

## ------------------------------------------------------------------------
taxon_ranks(tax)

## ------------------------------------------------------------------------
supertaxa(tax, subset = taxon_ranks(tax) == "genus", value = "taxon_ranks")

## ------------------------------------------------------------------------
subtaxa(tax, value = "taxon_names")

## ------------------------------------------------------------------------
roots(tax, value = "taxon_names")

## ------------------------------------------------------------------------
leaves(tax, value = "taxon_names")

## ------------------------------------------------------------------------
info <- data.frame(name = c("tiger", "cat", "mole", "human", "tomato", "potato"),
                   n_legs = c(4, 4, 4, 2, 0, 0),
                   dangerous = c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE))

phylopic_ids <- c("e148eabb-f138-43c6-b1e4-5cda2180485a",
                  "12899ba0-9923-4feb-a7f9-758c3c7d5e13",
                  "11b783d5-af1c-4f4e-8ab5-a51470652b47",
                  "9fae30cd-fb59-4a81-a39c-e1826a35f612",
                  "b6400f39-345a-4711-ab4f-92fd4e22cb1a",
                  "63604565-0406-460b-8cb8-1abe954b3f3a")

foods <- list(c("mammals", "birds"),
              c("cat food", "mice"),
              c("insects"),
              c("Most things, but especially anything rare or expensive"),
              c("light", "dirt"),
              c("light", "dirt"))

reaction <- function(x) {
  ifelse(x$data$info$dangerous,
         paste0("Watch out! That ", x$data$info$name, " might attack!"),
         paste0("No worries; its just a ", x$data$info$name, "."))
}

my_taxmap <- taxmap(tiger, cat, mole, human, tomato, potato,
                    data = list(info = info,
                                phylopic_ids = phylopic_ids,
                                foods = foods),
                    funcs = list(reaction = reaction))

## ------------------------------------------------------------------------
all_names(my_taxmap)

## ------------------------------------------------------------------------
get_data(my_taxmap)

## ------------------------------------------------------------------------
filter_taxa(my_taxmap, startsWith(taxon_names, "t"))

## ----eval=FALSE----------------------------------------------------------
#  filter_taxa(my_taxmap, startsWith(taxon_names, "t"), c("b", "r", "o"))

## ------------------------------------------------------------------------
filter_taxa(my_taxmap, startsWith(taxon_names, "t"), supertaxa = TRUE)

## ------------------------------------------------------------------------
filter_obs(my_taxmap, "info", dangerous == TRUE)

## ------------------------------------------------------------------------
filter_obs(my_taxmap, "info", dangerous == TRUE, drop_taxa = TRUE)

## ------------------------------------------------------------------------
set.seed(1)
sample_n_taxa(my_taxmap, 3) # "3" here is a taxon index in the edge list
set.seed(1)
sample_n_taxa(my_taxmap, 3, supertaxa = TRUE)

## ------------------------------------------------------------------------
mutate_obs(my_taxmap, "info",
           new_col = "Im new",
           newer_col = paste0(new_col, "er!"))

## ------------------------------------------------------------------------
# Selecting a column by name
select_obs(my_taxmap, "info", dangerous)

# Selecting a column by index
select_obs(my_taxmap, "info", 3)

# Selecting a column by regular expressions (i.e. TRUE/FALSE)
select_obs(my_taxmap, "info", matches("^dange"))

## ------------------------------------------------------------------------
arrange_taxa(my_taxmap, taxon_names)
arrange_obs(my_taxmap, "info", name)

## ----results='asis', echo = FALSE----------------------------------------
fig_path <- "parsing_guide.png"
width <- 800
if (knitr:::child_mode()) { # if run as a child
  fig_path <- file.path("vignettes", fig_path)
}
cat(paste0('<img src="', fig_path, '" title="parsing diagram" width="',
       width, '">'))

## ------------------------------------------------------------------------
ex_hierarchy1
# specific ranks by rank name
pick(ex_hierarchy1, ranks("family"))
# two elements by taxonomic name
pick(ex_hierarchy1, nms("Poaceae", "Poa"))
# two elements by taxonomic identifier
pick(ex_hierarchy1, ids(4479, 4544))
# combine types
pick(ex_hierarchy1, ranks("family"), ids(4544))

## ------------------------------------------------------------------------
ex_hierarchy1
# specific ranks by rank name
pop(ex_hierarchy1, ranks("family"))
# two elements by taxonomic name
pop(ex_hierarchy1, nms("Poaceae", "Poa"))
# two elements by taxonomic identifier
pop(ex_hierarchy1, ids(4479, 4544))
# combine types
pop(ex_hierarchy1, ranks("family"), ids(4544))

## ------------------------------------------------------------------------
ex_hierarchy1
# keep all taxa between family and genus
# - by rank name, taxonomic name or ID
span(ex_hierarchy1, nms("Poaceae", "Poa"))

# keep all taxa greater than genus
span(ex_hierarchy1, ranks("> genus"))

# keep all taxa greater than or equal to genus
span(ex_hierarchy1, ranks(">= genus"))

# keep all taxa less than Felidae
span(ex_hierarchy2, nms("< Felidae"))

## Multiple operator statements - useful with larger classifications
ex_hierarchy3
span(ex_hierarchy3, ranks("> genus"), ranks("< phylum"))

