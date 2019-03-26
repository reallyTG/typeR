library(phuse)


### Name: extract_fns
### Title: Extract File Names from Script Metadata
### Aliases: extract_fns

### ** Examples

  a <- "https://github.com/phuse-org/phuse-scripts/raw/master"
  b <- "development/R/scripts"
  c <- "Draw_Dist2_R.yml"
  f1 <- paste(a,b,c, sep = '/')
  f2 <- read_yml(f1)
  f3 <- extract_fns(f2)



