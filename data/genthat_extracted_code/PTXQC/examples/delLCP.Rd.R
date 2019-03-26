library(PTXQC)


### Name: delLCP
### Title: Removes the longest common prefix (LCP) from a vector of
###   strings.
### Aliases: delLCP

### ** Examples

  delLCP(c("TK12345_H1"), min_out_length=0)
  ## ""

  delLCP(c("TK12345_H1"), min_out_length=4)
  ## "5_H1"

  delLCP(c("TK12345_H1"), min_out_length=4, add_dots = TRUE)
  ## "..5_H1"

  delLCP(c("TK12345_H1", "TK12345_H2"), min_out_length=4)
  ## "5_H1" "5_H2"

  delLCP(c("TK12345_H1", "TK12345_H2"), min_out_length=4, add_dots = TRUE)
  ## "..5_H1" "..5_H2"

  delLCP(c("TK12345_H1", "TK12345_H2"), min_out_length=8)
  ## "12345_H1", "12345_H2"

  delLCP(c("TK12345_H1", "TK12345_H2"), min_out_length=8, add_dots = TRUE)
  ## "TK12345_H1", "TK12345_H2" (unchanged, since '..' would add another two)

  delLCP(c("TK12345_H1", "TK12345_H2"), min_out_length=60)
  ## "TK12345_H1", "TK12345_H2" (unchanged)

  delLCP(c("TK12345_H1", "TK12345_H2"), min_out_length=60, add_dots = TRUE)
  ## "TK12345_H1", "TK12345_H2" (unchanged)





