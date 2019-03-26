library(phuse)


### Name: merge_lists
### Title: Compare and merge two lists
### Aliases: merge_lists

### ** Examples

  a <- "https://github.com/phuse-org/phuse-scripts/raw/master"
  b <- "development/R/scripts"
  c <- "Draw_Dist_R.yml"
  f1 <- paste(a,b,c, sep = '/')
  dr <- resolve(system.file("examples", package = "phuse"), "02_display")
  f2 <- paste(dr, "www", "Draw_Dist_R.yml", sep = '/')
  r1 <- read_yml(f1)
  r2 <- read_yml(f2)
  r3 <- merge_lists(r1, r2)



