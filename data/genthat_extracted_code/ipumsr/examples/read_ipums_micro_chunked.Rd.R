library(ipumsr)


### Name: read_ipums_micro_chunked
### Title: Read data from an IPUMS extract (in chunks)
### Aliases: read_ipums_micro_chunked read_ipums_micro_list_chunked

### ** Examples

# Select Minnesotan cases from CPS example (Note you can also accomplish
# this and avoid having to even download a huge file using the "Select Cases"
# functionality of the IPUMS extract system)
mn_only <- read_ipums_micro_chunked(
  ipums_example("cps_00006.xml"),
  IpumsDataFrameCallback$new(function(x, pos) {
    x[x$STATEFIP == 27, ]
  }),
  chunk_size = 1000 # Generally you want this larger, but this example is a small file
)

# Tabulate INCTOT average by state without storing full dataset in memory
library(dplyr)
inc_by_state <- read_ipums_micro_chunked(
  ipums_example("cps_00006.xml"),
  IpumsDataFrameCallback$new(function(x, pos) {
    x %>%
      mutate(
        INCTOT = lbl_na_if(
          INCTOT, ~.lbl %in% c("Missing.", "N.I.U. (Not in Universe)."))
        ) %>%
      filter(!is.na(INCTOT)) %>%
      group_by(STATEFIP = as_factor(STATEFIP)) %>%
      summarize(INCTOT_SUM = sum(INCTOT), n = n())
  }),
  chunk_size = 1000 # Generally you want this larger, but this example is a small file
) %>%
group_by(STATEFIP) %>%
summarize(avg_inc = sum(INCTOT_SUM) / sum(n))

# x will be a list when using `read_ipums_micro_list_chunked()`
read_ipums_micro_list_chunked(
  ipums_example("cps_00010.xml"),
  IpumsSideEffectCallback$new(function(x, pos) {
    print(paste0(nrow(x$PERSON), " persons and ", nrow(x$HOUSEHOLD), " households in this chunk."))
  }),
  chunk_size = 1000 # Generally you want this larger, but this example is a small file
)

# Using the biglm package, you can even run a regression without storing
# the full dataset in memory
library(dplyr)
if (require(biglm)) {
  lm_results <- read_ipums_micro_chunked(
    ipums_example("cps_00015.xml"),
    IpumsBiglmCallback$new(
      INCTOT ~ AGE + HEALTH, # Simple regression (may not be very useful)
      function(x, pos) {
        x %>%
        mutate(
          INCTOT = lbl_na_if(
            INCTOT, ~.lbl %in% c("Missing.", "N.I.U. (Not in Universe).")
          ),
          HEALTH = as_factor(HEALTH)
        )
    }),
    chunk_size = 1000 # Generally you want this larger, but this example is a small file
  )
  summary(lm_results)
}




