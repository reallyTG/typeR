library(dint)


### Name: format_date_xx
### Title: Format a date_xx
### Aliases: format_date_xx format.date_y format.date_yq format.date_ym
###   format.date_yw format_yq_iso format_yq_short format_yq_shorter
###   format_ym_iso format_ym_short format_ym_shorter format_yw_iso
###   format_yw_short format_yw_shorter

### ** Examples

x <- date_ym(2018, c(1L, 10L, 3L, 6L, 4L, 5L, 7L, 12L, 2L, 9L, 8L, 11L))
fm <- "%Y-M%m: %B,%b"

format(
  x,
  format = fm,
  month_names = month.name,  # built-in R constant for English names
  month_abb = month.abb
)



