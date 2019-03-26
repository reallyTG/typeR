library(tcpl)


### Name: tcplSubsetChid
### Title: Subset level 5 data to a single sample per chemical
### Aliases: tcplSubsetChid

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfExample()

## Load the example level 5 data
d1 <- tcplLoadData(lvl = 5, fld = "aeid", val = 797)
d1 <- tcplPrepOtpt(d1)

## Subset to an example of a duplicated chid
d2 <- d1[chid == 20182]
d2[ , list(m4id, hitc, fitc, modl_ga)]

## Here the consensus hit-call is 1 (active), and the fit categories are 
## all equal. Therefore, if the flags are ignored, the selected sample will
## be the sample with the lowest modl_ga.
tcplSubsetChid(dat = d2, flag = FALSE)[ , list(m4id, modl_ga)]

## Reset configuration
options(conf_store)




