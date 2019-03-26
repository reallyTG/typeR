library(goeveg)


### Name: synsort
### Title: Sorting functions for synoptic tables
### Aliases: synsort

### ** Examples

## Synoptic table of Scheden vegetation data:
library(cluster)
pam1 <- pam(schedenveg, 4)

## Unordered synoptic tables
# Unordered synoptiv percentage frequency table
unordered <- syntable(schedenveg, pam1$clustering, abund = "perc",
                      type = "percfreq")
# Differential species analysis
differential <- syntable(schedenveg, pam1$clustering, abund = "perc",
                         type = "diffspec")
# Fidelity phi
phitable <- syntable(schedenveg, pam1$clustering, abund = "perc",
                     type = "phi")

## Common complete synoptic table: sort by percentage frequency,
## show all species
sorted <- synsort(syn1 = unordered$syntable, cluster = pam1$clustering,
                  method = "allspec", min1 = 0)
sorted             # view results

## Synoptic table, with only positive differentiating species with
## minimum 25% frequency in table
positive <- synsort(syn1 = unordered$syntable, syn2 = differential$syntable,
                    cluster = pam1$clustering, method = "p_diff", min1 = 25)
positive           # view results

## Synoptic table, with percentage frequency (only species >25%) and
## differential character.
complete <- synsort(syn1 = unordered$syntable, syn2 = differential$syntable,
                    cluster = pam1$clustering, method = "all_diff", min1 = 25)
complete

## Synoptic table, species with minimum phi-value of 0.3, show
## percentage frequency
phi_complete <- synsort(syn1 = unordered$syntable, syn2 = phitable$syntable,
                        cluster = pam1$clustering, method = "allspec", min1 = 25, min2 = 0.3)
phi_complete

## Synoptic table with only phi values
phi_table <- synsort(syn1 = phitable$syntable, cluster = pam1$clustering,
                     method = "allspec", min1 = 0.3)
phitable

## Synoptic table showing diagnostic phi phi-values (>=0.3) and
## differential character
phi_diff <- synsort(syn1 = phitable$syntable, syn2 = differential$syntable,
                    cluster = pam1$clustering, method = "all_diff", min1 = 0.3)
phi_diff



