library(huxtable)


### Name: number_format
### Title: Number format
### Aliases: number_format number_format<- set_number_format
###   map_number_format

### ** Examples

ht <- huxtable(
        number_format = c(
          "Default",
          "NA",
          "2",
          "\"%5.2f\"",
          "Pretty",
          "Sign"
        ),
        a = rep(1000, 6),
        b = rep(1000.005, 6),
        c = rep(0.0001, 6),
        d = rep(-1, 6),
        e = rep("3.2 (s.e. 1.4)", 6),
        add_colnames = TRUE
      )

number_format(ht)[3, -1] <- NA
number_format(ht)[4, -1] <- 2
number_format(ht)[5, -1] <- "%5.2f"

number_format(ht)[6, -1] <- list(
        function(x)
          prettyNum(x, big.mark = ",",
                scientific = FALSE)
      )

number_format(ht)[7, -1] <- list(
        function(x) if (x > 0) "+" else "-"
      )

right_border(ht) <- 1
bottom_border(ht)[1, ] <- 1

ht

ht_bands <- huxtable("10000 Maniacs", autoformat = FALSE)
# probably not what you want:
ht_bands
# fixed:
set_number_format(ht_bands, NA)
# alternatively:
huxtable("10000 Maniacs", autoformat = TRUE)


set_number_format(jams, 2)
set_number_format(jams,
      2:3, 1, 2)
map_number_format(jams,
      by_rows(2, 3))



