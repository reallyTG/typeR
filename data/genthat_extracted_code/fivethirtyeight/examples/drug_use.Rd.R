library(fivethirtyeight)


### Name: drug_use
### Title: How Baby Boomers Get High
### Aliases: drug_use
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
use <- drug_use %>%
  select(age, n, ends_with("_use")) %>%
  gather(drug, use, -c(age, n)) %>%
  mutate(drug = str_sub(drug, start=1, end=-5))
freq <- drug_use %>%
  select(age, n, ends_with("_freq")) %>%
  gather(drug, freq, -c(age, n)) %>%
  mutate(drug = str_sub(drug, start=1, end=-6))
drug_use_tidy <- left_join(x=use, y=freq, by = c("age", "n", "drug")) %>%
  arrange(age)



