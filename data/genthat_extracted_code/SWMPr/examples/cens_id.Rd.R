library(SWMPr)


### Name: cens_id
### Title: Flag observations above/below detection limits
### Aliases: cens_id cens_id.swmpr

### ** Examples

## get data
data(apacpnut)
dat <- apacpnut

## convert all qaqc columns to censored flags, -1 below, 0 within, 1 above
cens_id(dat)

## T/F for above or within, note that none are above
cens_id(dat, flag_type = 'above')

## T/F for below or within
cens_id(dat, flag_type = 'below')



