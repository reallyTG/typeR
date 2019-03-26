library(phenofit)


### Name: plot_phenofit
### Title: plot_phenofit
### Aliases: plot_phenofit

### ** Examples

library(phenofit)
data("MOD13A1")

df <- tidy_MOD13.gee(MOD13A1$dt)
st <- MOD13A1$st

date_start <- as.Date('2013-01-01')
date_end   <- as.Date('2016-12-31')

sitename <- 'CA-NS6' # df$site[1]
d     <- df[site == sitename & (date >= date_start & date <= date_end), ]
sp    <- st[site == sitename, ]
south <- sp$lat < 0
nptperyear <- 23

# global parameter
IsPlot = TRUE
print  = FALSE
ypeak_min  = 0.05
wFUN = wTSM

# add one year in head and tail
dnew     <- add_HeadTail(d, south = south, nptperyear = nptperyear) 
INPUT    <- check_input(dnew$t, dnew$y, dnew$w, QC_flag = dnew$QC_flag,
     nptperyear = nptperyear, south = south, 
     maxgap = nptperyear/4, alpha = 0.02, wmin = 0.2)
# Rough fitting and growing season dividing
brks2 <- season_mov(INPUT,
    rFUN = wWHIT, wFUN = wFUN,
    plotdat = d, IsPlot = IsPlot, print = FALSE, IsPlot.OnlyBad = FALSE)
# Fine fitting
fit <- curvefits(
    INPUT, brks2,
    methods = c("AG", "Beck", "Elmore", "Zhang"), #,"klos", "Gu"
    wFUN = wFUN,
    nextent = 2, maxExtendMonth = 2, minExtendMonth = 1, minPercValid = 0.2,
    print = TRUE, verbose = FALSE)
## visualization
df_fit <- get_fitting(fit)
g <- plot_phenofit(df_fit, brks2)
grid::grid.newpage(); grid::grid.draw(g)



