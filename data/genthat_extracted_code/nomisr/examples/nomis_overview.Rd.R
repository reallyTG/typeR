library(nomisr)


### Name: nomis_overview
### Title: Nomis dataset overview
### Aliases: nomis_overview

### ** Examples

## No test: 
library(dplyr)

q <- nomis_overview("NM_1650_1")

q %>% tidyr::unnest(name) %>% glimpse()

s <- nomis_overview("NM_1650_1", select = c("Units", "Keywords"))

s %>% tidyr::unnest(name) %>% glimpse()
## End(No test)



