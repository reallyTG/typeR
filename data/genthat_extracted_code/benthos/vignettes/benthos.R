## ----setup, include = FALSE-----------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = NA_character_
)
options(dplyr.width = 100, width = 100)
set.seed(314)

## -------------------------------------------------------------------------------------------------
library(benthos)

## ---- message=FALSE-------------------------------------------------------------------------------
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)

## -------------------------------------------------------------------------------------------------
data(oosterschelde)

## -------------------------------------------------------------------------------------------------
oosterschelde

## ---- eval=FALSE----------------------------------------------------------------------------------
#  ?oosterschelde

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    filter(months(DATE) %in% c("August", "September"))

## -------------------------------------------------------------------------------------------------
oosterschelde %>% 
    mutate(COMPLIANT = is_accepted(taxon = TAXON)) %>%
    select(OBJECTID, HABITAT, DATE, TAXON, COUNT, COMPLIANT)

## -------------------------------------------------------------------------------------------------
oosterschelde %>% 
    mutate(COMPLIANT = is_accepted(taxon = TAXON)) %>%
    summarise(
        N_RECORDS = n(),
        N_COMPLIANT = sum(COMPLIANT),
        N_MISSING = N_RECORDS - N_COMPLIANT
    )

## -------------------------------------------------------------------------------------------------
oosterschelde %>% 
    filter(!is_accepted(taxon = TAXON))
oosterschelde <- oosterschelde %>% 
    filter(is_accepted(taxon = TAXON))

## -------------------------------------------------------------------------------------------------
is_accepted(taxon = "Petricola pholadiformis")
as_accepted(taxon = "Petricola pholadiformis")
is_accepted(taxon = "Petricolaria pholadiformis")

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    mutate(TAXON = as_accepted(TAXON))

## -------------------------------------------------------------------------------------------------
oosterschelde %>% 
    filter(!is_accepted(taxon = TAXON)) %>%
    nrow

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    mutate(
        GENERIC  = generic_name(TAXON),
        SPECIFIC = specific_name(TAXON)
    )
oosterschelde

## -------------------------------------------------------------------------------------------------
is_binomen("Nephtys")
is_binomen("Nephtys cirrosa")

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    mutate(
        IS_GENUS = is.na(GENERIC),
        GENERIC = ifelse(IS_GENUS, TAXON, GENERIC)
    )

## -------------------------------------------------------------------------------------------------
oosterschelde %>%
    filter(IS_GENUS) %>%
    nrow

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    group_by(ID, GENERIC) %>%
    mutate(NEWCOUNT = genus_to_species(is_genus = IS_GENUS, count = COUNT)) %>%
    ungroup

## -------------------------------------------------------------------------------------------------
oosterschelde %>%
    filter(GENERIC == "Corophium", ID == 130) %>%
    arrange(TAXON)

## -------------------------------------------------------------------------------------------------
oosterschelde %>%
    summarise(sum(COUNT), sum(NEWCOUNT))

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    mutate(COUNT = NEWCOUNT) %>%
    select(ID, HABITAT, AREA, DATE, TAXON, COUNT) %>%
    filter(COUNT > 0)
oosterschelde

## -------------------------------------------------------------------------------------------------
d <- oosterschelde %>%
    group_by(AREA) %>%
    summarise(n = n())
d

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>%
    mutate(YEAR = DATE %>% format("%Y"))

## -------------------------------------------------------------------------------------------------
n_pool_runs <- 10
pool_runs <- replicate(
    n = n_pool_runs, {
    oosterschelde %>% 
        group_by(HABITAT, YEAR) %>%
        mutate(
            POOLID = pool(
                sample_id = ID, 
                area = AREA, 
                target_area = c(0.09, 0.11)
            )
        ) %>%
        ungroup %>%
        select(POOLID)
    }
)

## -------------------------------------------------------------------------------------------------
names(pool_runs) <- paste0("POOLRUN", 1:n_pool_runs)
pool_runs <- pool_runs %>% as_data_frame
pool_runs

## -------------------------------------------------------------------------------------------------
oosterschelde_orig <- oosterschelde
oosterschelde <- oosterschelde %>%
    bind_cols(pool_runs) %>% 
    as_data_frame 
oosterschelde

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde %>% 
    gather(key = "POOLRUN", value = "POOLID", starts_with("POOLRUN")) %>%
    mutate(POOLRUN = parse_number(POOLRUN) %>% as.integer) %>%
    filter(!is.na(POOLID)) %>%
    select(POOLRUN, POOLID, HABITAT, AREA, YEAR, ID, TAXON, COUNT)
oosterschelde

## -------------------------------------------------------------------------------------------------
d <- oosterschelde %>%
    group_by(HABITAT, YEAR, POOLRUN, POOLID) %>%
    select(ID, AREA) %>%
    distinct(ID, AREA) %>%
    summarise(AREA = sum(AREA))
d

## -------------------------------------------------------------------------------------------------
d <- d %>%
    select(AREA) %>%
    group_by(AREA) %>%
    summarise(n = n()) %>%
    arrange(AREA)
d

## ---- fig.retina=NULL, fig.width=5, fig.height=3, out.width=500, echo=FALSE-----------------------
ggplot(data = d) +
    geom_vline(xintercept = c(0.09, 0.11), colour = "red", size = 1, alpha = 0.5) +
    geom_linerange(
        mapping = aes(x = AREA, ymin= 0, ymax = n),
        colour = "seashell4", size = 2
    ) +
    scale_x_continuous(name = "area pooled sample (m2)")

## -------------------------------------------------------------------------------------------------
d <- oosterschelde %>%
    group_by(HABITAT, YEAR, POOLRUN, POOLID) %>%
    summarise(S = species_richness(taxon = TAXON, count = COUNT))
d

## -------------------------------------------------------------------------------------------------
d <- d %>%
    group_by(HABITAT, YEAR) %>%
    summarise(S = mean(S))
d

## -------------------------------------------------------------------------------------------------
d <- oosterschelde %>% 
    filter(HABITAT == "Polyhaline-Subtidal", YEAR == 2010, POOLRUN == 1, POOLID == 1) %>%
    select(TAXON, COUNT) %>%
    arrange(TAXON)
d

## -------------------------------------------------------------------------------------------------
d %>% total_abundance(count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>% abundance(taxon = TAXON, count = COUNT) %>% as.matrix

## -------------------------------------------------------------------------------------------------
d %>% species_richness(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>% margalef(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>% rygg(taxon = TAXON, count = COUNT)

## ---- echo=FALSE, message=FALSE-------------------------------------------------------------------
x <- bind_rows(
    data_frame(S =  1, N = c(1:9, 1:10*10)),
    data_frame(S =  2, N = c(2:9, 1:10*10)),
    data_frame(S =  3, N = c(3:9, 1:10*10)),
    data_frame(S =  4, N = c(4:9, 1:10*10)),
    data_frame(S =  5, N = c(5:9, 1:10*10)),
    data_frame(S = 10, N = 1:10*10),
    data_frame(S = 25, N = c(25, 3:10*10))) %>% 
    mutate(
        margalef = (S-1) / log(N),
        SN_rygg = log(S) / log(log(N)),
        SN_adj  = log(S) / log1p(log1p(N)),
        S = factor(S, ordered = TRUE)
    ) %>% 
    gather(key = "index", value = "value", margalef, SN_rygg, SN_adj)
x$value[!is.finite(x$value) | is.nan(x$value)] <- NA_real_

## ---- fig.width=7, fig.height=7, out.width=500, echo=FALSE, warning=FALSE-------------------------
ggplot(
    data = x, 
    mapping = aes(x = N, y = value, group = S, colour = S)
) +
    geom_path(size = 1, na.rm = TRUE) +
    geom_point(size = 3, na.rm = TRUE) +
    scale_x_continuous(breaks = c(1, 2, 3, 5, 10, 25, 50, 75, 100)) +
    coord_trans(x = "log10") +
    facet_grid(index~., scales = "free_y")

## -------------------------------------------------------------------------------------------------
d %>% rygg(taxon = TAXON, count = COUNT, adjusted = TRUE)

## -------------------------------------------------------------------------------------------------
d %>% hurlbert(taxon = TAXON, count = COUNT, n = 100)

## ---- echo=FALSE, fig.width=7, fig.height=4, out.width=500, echo=FALSE----------------------------
n <- seq_len(d %>% total_abundance(count = COUNT))
ESn <- sapply(X = n, FUN = function(n) {
    d %>% hurlbert(taxon = TAXON, count = COUNT, n = n)
})
ggplot(data = data.frame(n = n, ESn = ESn)) +
    geom_point(mapping = aes(x = n, y = ESn)) +
    scale_x_continuous(name = expression(italic(n))) +
    scale_y_continuous(name = expression(E(italic(S)[n])))

## -------------------------------------------------------------------------------------------------
d %>% simpson(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>% hpie(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
1 - d %>% simpson(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>% shannon(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>% hill(taxon = TAXON, count = COUNT, a = 0)
d %>% hill(taxon = TAXON, count = COUNT, a = 1)
d %>% hill(taxon = TAXON, count = COUNT, a = 2)

## -------------------------------------------------------------------------------------------------
d %>% hill0(taxon = TAXON, count = COUNT)
d %>% hill1(taxon = TAXON, count = COUNT)
d %>% hill2(taxon = TAXON, count = COUNT)

## ---- fig.retina=NULL, fig.width=6, fig.height=4, out.width=500, echo=FALSE, warning=FALSE, message=FALSE----
a <- seq(from = 0, to = 2, by = 0.1)
N_a <- sapply(X = a, FUN = function(a) {
    d %>% hill(taxon = TAXON, count = COUNT, a = a)
})
ggplot(data = data.frame(a, N_a)) +
    geom_path(mapping = aes(x = a, y = N_a)) +
    geom_text(x = 0, y = 1, label = "<- rare species",   hjust = 0, vjust = 1, colour = "blue") +
    geom_text(x = 2, y = 1, label = "common species ->", hjust = 1, vjust = 1, colour = "blue") +
    scale_x_continuous(name = expression(italic(a))) +
    scale_y_continuous(name = expression(italic(N[a])), limits = c(0, NA))

## -------------------------------------------------------------------------------------------------
d %>% 
    ambi(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>%
    mutate(HAS_GROUP = has_ambi(taxon = TAXON))

## -------------------------------------------------------------------------------------------------
d %>%
    mutate(HAS_GROUP = has_ambi(taxon = TAXON)) %>%
    summarise(percentage = 100 * sum(COUNT[!HAS_GROUP]) / sum(COUNT)) %>%
    as.numeric

## -------------------------------------------------------------------------------------------------
d %>% 
    iti(taxon = TAXON, count = COUNT)

## -------------------------------------------------------------------------------------------------
d %>%
    mutate(HAS_GROUP = has_iti(taxon = TAXON))

## -------------------------------------------------------------------------------------------------
d %>%
    mutate(HAS_GROUP = has_iti(taxon = TAXON)) %>%
    summarise(percentage = 100 * sum(COUNT[!HAS_GROUP]) / sum(COUNT)) %>%
    as.numeric

## -------------------------------------------------------------------------------------------------
oosterschelde %>% 
    group_by(HABITAT, YEAR, POOLRUN, POOLID) %>% 
    summarise(
        N = total_abundance(count = COUNT),
        S = species_richness(taxon = TAXON, count = COUNT),
        D = margalef(taxon = TAXON, count = COUNT),
        SN = rygg(taxon = TAXON, count = COUNT),
        SNa = rygg(taxon = TAXON, count = COUNT, adjusted = TRUE),
        H = shannon(taxon = TAXON, count = COUNT)
    )

## -------------------------------------------------------------------------------------------------
oosterschelde %>% 
    group_by(HABITAT, YEAR, POOLRUN, POOLID) %>% 
    summarise(
        N = total_abundance(., COUNT),
        S = species_richness(., TAXON, COUNT),
        D = margalef(., TAXON, COUNT),
        SN = rygg(., TAXON, COUNT),
        SNa = rygg(., TAXON, COUNT, adjusted = TRUE),
        H = shannon(., TAXON, COUNT)
    )

## -------------------------------------------------------------------------------------------------
oosterschelde <- oosterschelde_orig
n_pool_runs <- 100
pool_runs <- replicate(
    n = n_pool_runs, {
    oosterschelde %>% 
        group_by(HABITAT, YEAR) %>%
        mutate(
            POOLID = pool(
                sample_id = ID, 
                area = AREA, 
                target_area = c(0.09, 0.11)
            )
        ) %>%
        ungroup %>%
        select(POOLID)
    }
)
names(pool_runs) <- paste0("POOLRUN", 1:n_pool_runs)

d <- pool_runs %>% 
    as_data_frame %>%
    bind_cols(oosterschelde) %>% 
    as_data_frame %>%
    gather(key = "POOLRUN", value = "POOLID", starts_with("POOLRUN")) %>%
    mutate(POOLRUN = parse_number(POOLRUN) %>% as.integer) %>%
    filter(!is.na(POOLID)) %>%
    select(POOLRUN, POOLID, HABITAT, AREA, YEAR, ID, TAXON, COUNT) %>%
    group_by(HABITAT, YEAR, POOLRUN, POOLID) %>%
    summarise(S = species_richness(taxon = TAXON, count = COUNT)) %>%
    group_by(HABITAT, YEAR, POOLRUN) %>%
    summarise(S = mean(S)) %>%
    mutate(S_rm = cummean(S)) 
d

## ---- fig.retina=NULL, fig.width=7, fig.height=4, out.width=650, echo=FALSE, warning=FALSE--------
ggplot(data = d) +
    geom_point(mapping = aes(x = POOLRUN, y = S), col = "blue") +
    geom_path(mapping = aes(x = POOLRUN, y = S_rm), col = "red") +
    facet_grid(HABITAT ~ YEAR)

