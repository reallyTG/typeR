library(SWMPr)


### Name: decomp_cj
### Title: Simple trend decomposition of monthly swmpr data
### Aliases: decomp_cj decomp_cj.swmpr decomp_cj.default

### ** Examples

## get data
data(apacpnut)
dat <- apacpnut
dat <- qaqc(dat, qaqc_keep = NULL)

## decomposition of chl, values as data.frame
decomp_cj(dat, param = 'chla_n', vals_out = TRUE)

## decomposition of chl, ggplot
decomp_cj(dat, param = 'chla_n')

## decomposition changing arguments passed to decompTs
decomp_cj(dat, param = 'chla_n', type = 'mult')

## monthly decomposition of continuous data
data(apacpwq)
dat2 <- qaqc(apacpwq)

decomp_cj(dat2, param = 'do_mgl')

## using the default method with a data frame
dat <- data.frame(dat)
decomp_cj(dat, param = 'chla_n', date_col = 'datetimestamp')



