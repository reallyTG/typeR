library(taxa)


### Name: parse_tax_data
### Title: Convert one or more data sets to taxmap
### Aliases: parse_tax_data

### ** Examples

 # Read a vector of classifications
 my_taxa <- c("Mammalia;Carnivora;Felidae",
              "Mammalia;Carnivora;Felidae",
              "Mammalia;Carnivora;Ursidae")
 parse_tax_data(my_taxa, class_sep = ";")

 # Read a list of classifications
 my_taxa <- list("Mammalia;Carnivora;Felidae",
                "Mammalia;Carnivora;Felidae",
                "Mammalia;Carnivora;Ursidae")
 parse_tax_data(my_taxa, class_sep = ";")

 # Read classifications in a table in a single column
 species_data <- data.frame(tax = c("Mammalia;Carnivora;Felidae",
                                    "Mammalia;Carnivora;Felidae",
                                    "Mammalia;Carnivora;Ursidae"),
                           species_id = c("A", "B", "C"))
 parse_tax_data(species_data, class_sep = ";", class_cols = "tax")

 # Read classifications in a table in multiple columns
 species_data <- data.frame(lineage = c("Mammalia;Carnivora;Felidae",
                                        "Mammalia;Carnivora;Felidae",
                                        "Mammalia;Carnivora;Ursidae"),
                            species = c("Panthera leo",
                                        "Panthera tigris",
                                        "Ursus americanus"),
                            species_id = c("A", "B", "C"))
 parse_tax_data(species_data, class_sep = c(" ", ";"),
                class_cols = c("lineage", "species"))

 # Read classification tables with one column per rank
 species_data <- data.frame(class = c("Mammalia", "Mammalia", "Mammalia"),
                            order = c("Carnivora", "Carnivora", "Carnivora"),
                            family = c("Felidae", "Felidae", "Ursidae"),
                            genus = c("Panthera", "Panthera", "Ursus"),
                            species = c("leo", "tigris", "americanus"),
                            species_id = c("A", "B", "C"))
  parse_tax_data(species_data, class_cols = 1:5)
  parse_tax_data(species_data, class_cols = 1:5,
                 named_by_rank = TRUE) # makes `taxon_ranks()` work

 # Classifications with extra information
 my_taxa <- c("Mammalia_class_1;Carnivora_order_2;Felidae_genus_3",
              "Mammalia_class_1;Carnivora_order_2;Felidae_genus_3",
              "Mammalia_class_1;Carnivora_order_2;Ursidae_genus_3")
 parse_tax_data(my_taxa, class_sep = ";",
                class_regex = "(.+)_(.+)_([0-9]+)",
                class_key = c(my_name = "taxon_name",
                              a_rank = "taxon_rank",
                              some_num = "info"))


  # --- Parsing multiple datasets at once (advanced) ---
  # The rest is one example for how to classify multiple datasets at once.

  # Make example data with taxonomic classifications
  species_data <- data.frame(tax = c("Mammalia;Carnivora;Felidae",
                                     "Mammalia;Carnivora;Felidae",
                                     "Mammalia;Carnivora;Ursidae"),
                             species = c("Panthera leo",
                                         "Panthera tigris",
                                         "Ursus americanus"),
                             species_id = c("A", "B", "C"))

  # Make example data associated with the taxonomic data
  # Note how this does not contain classifications, but
  # does have a varaible in common with "species_data" ("id" = "species_id")
  abundance <- data.frame(id = c("A", "B", "C", "A", "B", "C"),
                          sample_id = c(1, 1, 1, 2, 2, 2),
                          counts = c(23, 4, 3, 34, 5, 13))

  # Make another related data set named by species id
  common_names <- c(A = "Lion", B = "Tiger", C = "Bear", "Oh my!")

  # Make another related data set with no names
  foods <- list(c("ungulates", "boar"),
                c("ungulates", "boar"),
                c("salmon", "fruit", "nuts"))

  # Make a taxmap object with these three datasets
  x = parse_tax_data(species_data,
                     datasets = list(counts = abundance,
                                     my_names = common_names,
                                     foods = foods),
                     mappings = c("species_id" = "id",
                                  "species_id" = "{{name}}",
                                  "{{index}}" = "{{index}}"),
                     class_cols = c("tax", "species"),
                     class_sep = c(" ", ";"))

  # Note how all the datasets have taxon ids now
  x$data

  # This allows for complex mappings between variables that other functions use
  map_data(x, my_names, foods)
  map_data(x, counts, my_names)




