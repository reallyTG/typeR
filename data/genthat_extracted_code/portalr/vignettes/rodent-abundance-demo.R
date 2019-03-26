## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- warning = FALSE, message = FALSE-----------------------------------
library(tidyverse)
library(cowplot)
library(portalr)

## ------------------------------------------------------------------------
portal_data_path <- tempdir() # use a temporary folder to store downloaded data
data_tables <- load_data(portal_data_path, download_if_missing = TRUE)

## ------------------------------------------------------------------------
print(summary(data_tables))

## ------------------------------------------------------------------------
# get rodent abundance by plot
rodent_abundance_by_plot <- abundance(path = portal_data_path, time = "date", level = "plot") 

rodent_abundance <- rodent_abundance_by_plot %>%
  gather(species, abundance, -censusdate, -plot) %>%
  count(species, censusdate) %>%
  rename(abundance = n)
print(summary(rodent_abundance))

## ------------------------------------------------------------------------
join_scientific_name <- function(rodent_abundance, 
                                 species_table = data_tables$species_table)
{
  return(rodent_abundance %>%
           left_join(select(species_table, "species", "scientificname"), 
                     by = "species") %>%
           rename(scientific_name = scientificname)
  )
}

rodent_abundance <- join_scientific_name(rodent_abundance)

## ---- fig.cap = "Monthly abundance of rodents (all plots)", fig.width = 7.5, fig.height = 10----
make_abundance_plot_over_time <- function(rodent_abundance)
{
  return(ggplot(rodent_abundance, 
                aes(x = censusdate, y = abundance)) + 
           geom_line() + 
           facet_wrap(~scientific_name, scales = "free_y", ncol = 3) + 
           xlab("Date") + 
           ylab("Abundance") + 
           scale_x_date(breaks = seq(as.Date("1977-01-01"), to = as.Date("2018-01-01"), "+5 years"), 
                        date_labels = "%Y", 
                        limits = as.Date(c("1977-01-01", "2018-01-01"))) + 
           theme_cowplot() + 
           theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5), 
                 legend.position = "bottom", legend.justification = "center", 
                 strip.text.x = element_text(size = 10))
  )
}

my_plot <- make_abundance_plot_over_time(rodent_abundance)

print(my_plot)

## ------------------------------------------------------------------------
print(summary(data_tables$plots_table))

## ------------------------------------------------------------------------
plot_treatments <- data_tables$plots_table %>%
  mutate(iso_date = as.Date(paste0(year, "-", month, "-", "01")), 
         plot = as.factor(plot)) %>%
  select(iso_date, plot, treatment)

## ---- fig.cap = "Treatments of Plots by Date", fig.width = 7, fig.height = 10----
my_plot <- ggplot(plot_treatments, 
                  aes(x = iso_date, y = treatment, color = treatment)) +
  geom_point(shape = 20) + 
  geom_vline(aes(xintercept = as.Date("1977-10-01")), linetype = 2) + 
  geom_vline(aes(xintercept = as.Date("1988-01-01")), linetype = 2) + 
  geom_vline(aes(xintercept = as.Date("2005-01-01")), linetype = 2) + 
  geom_vline(aes(xintercept = as.Date("2015-04-01")), linetype = 2) + 
  facet_wrap(~plot, ncol = 4) + 
  xlab("Date") + 
  ylab("Treatment") + 
  scale_color_manual(values = rainbow(4)) + 
  scale_x_date(breaks = seq(as.Date("1977-01-01"), to = as.Date("2018-01-01"), "+5 years"), date_labels = "%Y") + 
  theme_cowplot() + 
  guides(color = FALSE) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

print(my_plot)

## ------------------------------------------------------------------------
always_control_plots <- plot_treatments %>% 
  group_by(plot) %>% 
  summarize(always_control = all(treatment == "control")) %>% 
  filter(always_control)

print(always_control_plots)

## ------------------------------------------------------------------------
mostly_control_plots <- plot_treatments %>% 
  filter(iso_date < "2015-01-01") %>%
  group_by(plot) %>%
  summarize(mostly_control = all(treatment == "control")) %>% 
  filter(mostly_control)

print(mostly_control_plots)

## ------------------------------------------------------------------------
date_span <- plot_treatments %>%
  filter(plot %in% mostly_control_plots$plot) %>%
  group_by(iso_date) %>%
  summarize(all_control = all(treatment == "control")) %>%
  filter(all_control)

print(date_span)

## ---- fig.cap = "Monthly abundance of rodents (control plots)", fig.width = 7.5, fig.height = 10----
rodent_abundance_by_plot %>%
  filter(censusdate >= min(date_span$iso_date), 
         censusdate <= max(date_span$iso_date), 
         plot %in% mostly_control_plots$plot) %>% 
  select(-treatment, -plot) %>%
  gather(species, abundance, -censusdate) %>%
  count(censusdate, species, wt = abundance) %>%
  rename(abundance = n) %>%
  join_scientific_name() %>% 
  {.} -> rodent_abundance_control

rodent_abundance_control %>%
  make_abundance_plot_over_time() %>%
  print()

## ------------------------------------------------------------------------
mostly_exclosure_plots <- plot_treatments %>% 
  filter(iso_date > as.Date("1989-01-01"), 
         iso_date < "2015-01-01") %>%
  group_by(plot) %>%
  summarize(mostly_exclosure = all(treatment == "exclosure")) %>% 
  filter(mostly_exclosure)

print(mostly_exclosure_plots)

## ------------------------------------------------------------------------
date_span <- plot_treatments %>%
  filter(plot %in% mostly_exclosure_plots$plot) %>%
  group_by(iso_date) %>%
  summarize(all_exclosure = all(treatment == "exclosure")) %>%
  filter(all_exclosure)

print(date_span)

## ---- fig.cap = "Monthly abundance of rodents (exclosure plots)", fig.width = 7.5, fig.height = 10----
rodent_abundance_by_plot %>%
  filter(censusdate >= min(date_span$iso_date), 
         censusdate <= max(date_span$iso_date), 
         plot %in% mostly_exclosure_plots$plot) %>% 
  select(-treatment, -plot) %>%
  gather(species, abundance, -censusdate) %>%
  count(censusdate, species, wt = abundance) %>%
  rename(abundance = n) %>%
  join_scientific_name() %>% 
  {.} -> rodent_abundance_exclosure

rodent_abundance_exclosure %>%
  make_abundance_plot_over_time() %>%
  print()

## ---- fig.cap = "Monthly abundance of rodents (control vs. exclosure plots)", fig.width = 7.5, fig.height = 10----
rodent_abundance_merged <- bind_rows(
  mutate(rodent_abundance_control, treatment = "control"), 
  mutate(rodent_abundance_exclosure, treatment = "exclosure"))

merged_plot <- ggplot(rodent_abundance_merged, 
                      aes(x = censusdate, y = abundance, color = treatment)) + 
  geom_line() + 
  facet_wrap(~scientific_name, scales = "free_y", ncol = 3) + 
  xlab("Date") + 
  ylab("Abundance") + 
  scale_x_date(breaks = seq(as.Date("1977-01-01"), to = as.Date("2018-01-01"), "+5 years"), 
               date_labels = "%Y", 
               limits = as.Date(c("1977-01-01", "2018-01-01"))) + 
  scale_color_manual(values = c("purple", "yellow")) + 
  theme_cowplot() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5), 
        legend.position = "bottom", legend.justification = "center", 
        strip.text.x = element_text(size = 10))

print(merged_plot)

