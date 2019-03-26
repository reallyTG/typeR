library(phuse)


### Name: init_cfg
### Title: Initialize configuration for phuse
### Aliases: init_cfg

### ** Examples

  a <- "https://github.com/phuse-org/phuse-scripts/raw/master"
  b <- "development/R/scripts"
  c <- "Draw_Dist2_R.yml"
  f1 <- paste(a,b,c, sep = '/')
  f2 <- read_yml(f1)
  r1 <- init_cfg(f2)



