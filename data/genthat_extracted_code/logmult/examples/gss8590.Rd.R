library(logmult)


### Name: gss8590
### Title: Education and Occupational Attainment Among Women in the United
###   States, 1985-1990
### Aliases: gss8590
### Keywords: datasets

### ** Examples

  ## see ?rc and ?plot.rc
  # The table reported in Wong (2010) has a cell inconsistent with
  # what was reported in Wong (2001). To fix this:
  data(gss8590)
  tab <- margin.table(gss8590[,,c(2,4)], 1:2)
  tab[2,4] <- 49



