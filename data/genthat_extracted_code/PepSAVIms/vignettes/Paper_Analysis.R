## ----setup, cache=FALSE, include=FALSE--------------------------------------------------
library(knitr)
knit_theme$set("default")
opts_chunk$set(cache=FALSE)
opts_knit$set(root.dir=normalizePath(".."))
options(width=90)

# Convenience function
fcom <- function(x) format(x, big.mark=",")

## ----reading-data-ms--------------------------------------------------------------------
library(PepSAVIms)

# Load mass spectrometry data into memory
data(mass_spec)

## ----reading-data-bioact----------------------------------------------------------------
# Load bioactivity data into memory
data(bioact)

## ----bin-info, echo=FALSE---------------------------------------------------------------

# Perform mass spectrometry levels consolidation
bnfo <- binMS(mass_spec = mass_spec,
              mtoz = "m/z",
              charge = "Charge",
              mass = "Mass",
              time_peak_reten = "Reten",
              ms_inten = NULL,
              time_range = c(14, 45),
              mass_range = c(2000, 15000),
              charge_range = c(2, 10),
              mtoz_diff = 0.05,
              time_diff = 60)$summ_info

## ----consolidating-data-----------------------------------------------------------------

# Perform mass spectrometry levels consolidation
bin_out <- binMS(mass_spec = mass_spec,
                 mtoz = "m/z",
                 charge = "Charge",
                 mass = "Mass",
                 time_peak_reten = "Reten",
                 ms_inten = NULL,
                 time_range = c(14, 45),
                 mass_range = c(2000, 15000),
                 charge_range = c(2, 10),
                 mtoz_diff = 0.05,
                 time_diff = 60)

# Show some summary information describing the consolidation process
summary(bin_out)

## ----filtering-data---------------------------------------------------------------------
# Perform mass spectrometry levels filtering
filter_out <- filterMS(msObj = bin_out,
                       region = paste0("VO_", 17:25),
                       border = "all",
                       bord_ratio = 0.01,
                       min_inten = 1000,
                       max_chg = 10)

# Show summary information describing the filtering process
summary(filter_out)

## ----candidate-compound-ranking---------------------------------------------------------

# Rank the candidate compounds using the ranking procedure for each of the
# bioactivity datasets

rank_oc <- rankEN(msObj      = filter_out,
                  bioact     = bioact$oc,
                  region_ms  = paste0("VO_", 18:22),
                  region_bio = paste0("VO_", 18:22),
                  lambda     = 0.001)

rank_bc <- rankEN(msObj      = filter_out,
                  bioact     = bioact$bc,
                  region_ms  = paste0("VO_", 18:22),
                  region_bio = paste0("VO_", 18:22),
                  lambda     = 0.001)

rank_pc <- rankEN(msObj      = filter_out,
                  bioact     = bioact$pc,
                  region_ms  = paste0("VO_", 18:23),
                  region_bio = paste0("VO_", 18:23),
                  lambda     = 0.001)

rank_ab <- rankEN(msObj      = filter_out,
                  bioact     = bioact$ab,
                  region_ms  = paste0("VO_", 17:21),
                  region_bio = paste0("VO_", 17:21),
                  lambda     = 0.001)

rank_pa <- rankEN(msObj      = filter_out,
                  bioact     = bioact$pa,
                  region_ms  = paste0("VO_", 18:21),
                  region_bio = paste0("VO_", 18:21),
                  lambda     = 0.001)

rank_ec <- rankEN(msObj      = filter_out,
                  bioact     = bioact$ec,
                  region_ms  = paste0("VO_", 18:25),
                  region_bio = paste0("VO_", 18:25),
                  lambda     = 0.001)

rank_fg <- rankEN(msObj      = filter_out,
                  bioact     = bioact$fg,
                  region_ms  = paste0("VO_", 19:24),
                  region_bio = paste0("VO_", 19:24),
                  lambda     = 0.001)

## ----cyO2-rankings----------------------------------------------------------------------
# Function to find the rank of cyO2 compounds
find_cyO2_rank <- function(rankEN_obj) {
    # The m/z values for the two incarnations of cyO2
    mval1 <- 1047.4897758000001886
    mval2 <- 1570.2413587500000176
    # Find the indices (corresponding to the ranks) of the cyO2 incarnations
          which((rankEN_obj$mtoz == mval1 & rankEN_obj$charge == 3) |
                (rankEN_obj$mtoz == mval2 & rankEN_obj$charge == 2))
}

# List the ranks for cyO2
lapply(list(ab=rank_ab, bc=rank_bc, ec=rank_ec, fg=rank_fg,
            oc=rank_oc, pa=rank_pa, pc=rank_pc),
       find_cyO2_rank)

