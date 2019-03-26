library(chron)


### Name: seq.dates
### Title: Generate Chron or Dates Sequences
### Aliases: seq.dates
### Keywords: chron

### ** Examples

seq.dates("01/01/92", "12/31/92", by = "months")
# [1] 01/01/92 02/01/92 03/01/92 04/01/92 05/01/92 06/01/92
# [7] 07/01/92 08/01/92 09/01/92 10/01/92 11/01/92 12/01/92

end.of.the.month <- seq.dates("02/29/92", by = "month", length = 15)
end.of.the.month
#  [1] 02/29/92 03/31/92 04/30/92 05/31/92 06/30/92 07/31/92
#  [7] 08/31/92 09/30/92 10/31/92 11/30/92 12/31/92 01/31/93
# [13] 02/28/93 03/31/93 04/30/93



