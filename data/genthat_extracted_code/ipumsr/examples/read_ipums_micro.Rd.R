library(ipumsr)


### Name: read_ipums_micro
### Title: Read data from an IPUMS extract
### Aliases: read_ipums_micro read_ipums_micro_list

### ** Examples

  # Rectangular example file
  cps_rect_ddi_file <- ipums_example("cps_00006.xml")

  cps <- read_ipums_micro(cps_rect_ddi_file)
  # Or load DDI separately to keep the metadata
  ddi <- read_ipums_ddi(cps_rect_ddi_file)
  cps <- read_ipums_micro(ddi)

  # Hierarchical example file
  cps_hier_ddi_file <- ipums_example("cps_00010.xml")

  # Read in "long" format and you get 1 data frame
  cps_long <- read_ipums_micro(cps_hier_ddi_file)
  head(cps_long)

  # Read in "list" format and you get a list of multiple data frames
  cps_list <- read_ipums_micro_list(cps_hier_ddi_file)
  head(cps_list$PERSON)
  head(cps_list$HOUSEHOLD)

  # Or you can use the \code{%<-%} operator from zeallot to unpack
  c(household, person) %<-% read_ipums_micro_list(cps_hier_ddi_file)
  head(person)
  head(household)




