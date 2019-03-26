library(AMR)


### Name: ggplot_rsi
### Title: AMR bar plots with 'ggplot'
### Aliases: ggplot_rsi geom_rsi facet_rsi scale_y_percent
###   scale_rsi_colours theme_rsi labels_rsi_count

### ** Examples

library(dplyr)
library(ggplot2)

# get antimicrobial results for drugs against a UTI:
ggplot(septic_patients %>% select(amox, nitr, fosf, trim, cipr)) +
  geom_rsi()

# prettify the plot using some additional functions:
df <- septic_patients[, c("amox", "nitr", "fosf", "trim", "cipr")]
ggplot(df) +
  geom_rsi() +
  scale_y_percent() +
  scale_rsi_colours() +
  labels_rsi_count() +
  theme_rsi()

# or better yet, simplify this using the wrapper function - a single command:
septic_patients %>%
  select(amox, nitr, fosf, trim, cipr) %>%
  ggplot_rsi()

# get only portions and no counts:
septic_patients %>%
  select(amox, nitr, fosf, trim, cipr) %>%
  ggplot_rsi(fun = portion_df)

# add other ggplot2 parameters as you like:
septic_patients %>%
  select(amox, nitr, fosf, trim, cipr) %>%
  ggplot_rsi(width = 0.5,
             colour = "black",
             size = 1,
             linetype = 2,
             alpha = 0.25)
## No test: 

# for colourblind mode, use divergent colours from the viridis package:
septic_patients %>%
  select(amox, nitr, fosf, trim, cipr) %>%
  ggplot_rsi() + scale_fill_viridis_d()


# it also supports groups (don't forget to use the group var on `x` or `facet`):
septic_patients %>%
  select(hospital_id, amox, nitr, fosf, trim, cipr) %>%
  group_by(hospital_id) %>%
  ggplot_rsi(x = hospital_id,
             facet = Antibiotic,
             nrow = 1) +
  labs(title = "AMR of Anti-UTI Drugs Per Hospital",
       x = "Hospital")

# genuine analysis: check 2 most prevalent microorganisms
septic_patients %>%
  # create new bacterial ID's, with all CoNS under the same group (Becker et al.)
  mutate(mo = as.mo(mo, Becker = TRUE)) %>%
  # filter on top three bacterial ID's
  filter(mo %in% top_freq(freq(.$mo), 3)) %>%
  # determine first isolates
  mutate(first_isolate = first_isolate(.,
                                       col_date = "date",
                                       col_patient_id = "patient_id",
                                       col_mo = "mo")) %>%
  # filter on first isolates
  filter(first_isolate == TRUE) %>%
  # get short MO names (like "E. coli")
  mutate(mo = mo_shortname(mo, Becker = TRUE)) %>%
  # select this short name and some antiseptic drugs
  select(mo, cfur, gent, cipr) %>%
  # group by MO
  group_by(mo) %>%
  # plot the thing, putting MOs on the facet
  ggplot_rsi(x = Antibiotic,
             facet = mo,
             translate_ab = FALSE,
             nrow = 1) +
  labs(title = "AMR of Top Three Microorganisms In Blood Culture Isolates",
       subtitle = "Only First Isolates, CoNS grouped according to Becker et al. (2014)",
       x = "Microorganisms")
## End(No test)



