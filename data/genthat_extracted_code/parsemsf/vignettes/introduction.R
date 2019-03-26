## ------------------------------------------------------------------------
library(parsemsf)

# Replace `parsemsf_example("test_db.msf")` with the path to a ThermoFisher MSF file
area_table <- make_area_table(parsemsf_example("test_db.msf"))
knitr::kable(head(area_table))

## ------------------------------------------------------------------------
# Replace `parsemsf_example("test_db.msf")` with the path to a ThermoFisher MSF file
abundances <- quantitate(c(parsemsf_example("test_db.msf"), 
                           parsemsf_example("test_db2.msf")))

knitr::kable(head(abundances))

## ------------------------------------------------------------------------
# Replace `parsemsf_example("test_db.msf")` with the path to a ThermoFisher MSF file
abundances <- quantitate(parsemsf_example("test_db.msf"))

knitr::kable(head(abundances))

## ------------------------------------------------------------------------
peptide_locs <- map_peptides(parsemsf_example("test_db.msf"))

# Select columns with start and end locations
peptide_locs <- peptide_locs[c("peptide_id", "protein_desc", 
                               "peptide_sequence", "start", "end")]

knitr::kable(head(peptide_locs))

## ---- message=F----------------------------------------------------------
library(ggplot2)
library(dplyr)

peptide_summary <- peptide_locs %>% 
  group_by(start, end) %>%
  summarize(spectral_count = n()) # Count peptides

pep_plot <- ggplot(peptide_summary,
       aes(x = start, xend = end, y = spectral_count, yend = spectral_count)) +
  geom_segment(size = 1) +
  ylim(0, 5) + 
  xlab("peptide position within protein") +
  ylab("peptide count")

pep_plot


