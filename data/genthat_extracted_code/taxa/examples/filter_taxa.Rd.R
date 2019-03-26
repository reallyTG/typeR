library(taxa)


### Name: filter_taxa
### Title: Filter taxa with a list of conditions
### Aliases: filter_taxa

### ** Examples

# Filter by index
filter_taxa(ex_taxmap, 1:3)

# Filter by taxon ID
filter_taxa(ex_taxmap, c("b", "c", "d"))

# Fiter by TRUE/FALSE
filter_taxa(ex_taxmap, taxon_names == "Plantae", subtaxa = TRUE)
filter_taxa(ex_taxmap, n_obs > 3)
filter_taxa(ex_taxmap, ! taxon_ranks %in% c("species", "genus"))
filter_taxa(ex_taxmap, taxon_ranks == "genus", n_obs > 1)

# Filter by an observation characteristic
dangerous_taxa <- sapply(ex_taxmap$obs("info"),
                         function(i) any(ex_taxmap$data$info$dangerous[i]))
filter_taxa(ex_taxmap, dangerous_taxa)

# Include supertaxa
filter_taxa(ex_taxmap, 12, supertaxa = TRUE)
filter_taxa(ex_taxmap, 12, supertaxa = 2)

# Include subtaxa
filter_taxa(ex_taxmap, 1, subtaxa = TRUE)
filter_taxa(ex_taxmap, 1, subtaxa = 2)

# Dont remove rows in user-defined data corresponding to removed taxa
filter_taxa(ex_taxmap, 2, drop_obs = FALSE)
filter_taxa(ex_taxmap, 2, drop_obs = c(info = FALSE))

# Remove a taxon and it subtaxa
filter_taxa(ex_taxmap, taxon_names == "Mammalia",
            subtaxa = TRUE, invert = TRUE)




