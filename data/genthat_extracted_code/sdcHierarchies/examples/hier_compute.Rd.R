library(sdcHierarchies)


### Name: hier_compute
### Title: compute a nested hierarchy
### Aliases: hier_compute

### ** Examples

## Example Regional Codes (NUTS)
# digits 1-2 (len=2, endpos=2) --> level 1
# digit 3 (len=1, endpos=3) --> level 2
# digits 4-5 (len=2, endpos=5) -> level 3

# all strings have equal length but total is not encoded in these values
geo_m <- c(
  "01051", "01053", "01054", "01055",
  "01056", "01057", "01058", "01059", "01060",
  "01061", "01062",
  "02000",
  "03151", "03152", "03153", "03154", "03155", "03156", "03157", "03158",
  "03251", "03252", "03254", "03255", "03256", "03257",
  "03351", "03352", "03353", "03354", "03355",
  "03356", "03357", "03358", "03359",
  "03360", "03361",
  "03451", "03452", "03453", "03454", "03455", "03456",
  "10155")

a <- hier_compute(
  inp = geo_m,
  dim_spec = c(2, 3, 5),
  root = "Tot",
  method = "endpos"
)
b <- hier_compute(
  inp = geo_m,
  dim_spec = c(2, 1, 2),
  root = "Tot",
  method = "len"
)
identical(
  hier_convert(a, as = "df"),
  hier_convert(b, as = "df")
)

# total is contained in the first 3 positions of the input values
# --> we need to set name of the overall total (argument "root")
# to NULL (the default)
geo_m_with_tot <- paste0("Tot", geo_m)
a <- hier_compute(
  inp = geo_m_with_tot,
  dim_spec = c(3, 2, 1, 2),
  method = "len"
)
b <- hier_compute(
  inp = geo_m_with_tot,
  dim_spec = c(3, 5, 6, 8),
  method = "endpos"
)
identical(a, b)

# example where inputs have unequal length
# the overall total is not included in input vector
yae_h <- c(
  "1.1.1.", "1.1.2.",
  "1.2.1.", "1.2.2.", "1.2.3.", "1.2.4.", "1.2.5.", "1.3.1.",
  "1.3.2.", "1.3.3.", "1.3.4.", "1.3.5.",
  "1.4.1.", "1.4.2.", "1.4.3.", "1.4.4.", "1.4.5.",
  "1.5.", "1.6.", "1.7.", "1.8.", "1.9.", "2.", "3.")

a <- hier_compute(
  inp = yae_h,
  dim_spec = c(2, 4, 6),
  root = "Tot",
  method = "endpos"
)
b <- hier_compute(
  inp = yae_h,
  dim_spec = c(2, 2, 2),
  root = "Tot",
  method = "len"
)
identical(
  hier_convert(a, as = "df"),
  hier_convert(b, as = "df")
)

# Same example, but overall total is contained in the first 3 positions
# of the input values --> argument "root" needs to be
# set to NULL (the default)
yae_h_with_tot <- paste0("Tot", yae_h)
a <- hier_compute(
  inp = yae_h_with_tot,
  dim_spec = c(3, 2, 2, 2),
  method = "len",
)
b <- hier_compute(
  inp = yae_h_with_tot,
  dim_spec = c(3, 5, 7, 9),
  method = "endpos"
)
identical(a, b)

# An example using a list as input (same as above)
# Hierarchy: digits 1-2 (nuts1), digit 3 (nut2), digits 4-5 (nuts3)
# The order of the list-elements is not important but the
# names of input-list correspond to (subtotal/level) names
geo_ll <- list()
geo_ll[["Total"]] <- c("01", "02", "03", "10")
geo_ll[["010"]]   <- c(
  "01051", "01053", "01054", "01055",
  "01056", "01057", "01058", "01059",
  "01060", "01061", "01062"
)
geo_ll[["031"]]   <- c(
  "03151", "03152", "03153", "03154",
  "03155", "03156", "03157", "03158"
)
geo_ll[["032"]]   <- c(
  "03251", "03252", "03254",
  "03255", "03256", "03257"
)
geo_ll[["033"]]   <- c(
  "03351", "03352", "03353", "03354", "03355",
  "03356", "03357", "03358", "03359",
  "03360", "03361"
)
geo_ll[["034"]]   <- c(
  "03451", "03452", "03453",
  "03454", "03455","03456"
)
geo_ll[["01"]]    <- "010"
geo_ll[["02"]]    <- "020"
geo_ll[["020"]]   <- "02000"
geo_ll[["03"]]    <- c("031", "032", "033", "034")
geo_ll[["10"]]    <- "101"
geo_ll[["101"]]   <- "10155"

d <- hier_compute(
  inp = geo_ll,
  root = "Total",
  method = "list"
); d

## Reproduce example from above with input defined as named list
yae_ll <- list()
yae_ll[["Total"]] <- c("1.", "2.", "3.")
yae_ll[["1."]] <- paste0("1.", 1:9, ".")
yae_ll[["1.1."]] <- paste0("1.1.", 1:2, ".")
yae_ll[["1.2."]] <- paste0("1.2.", 1:5, ".")
yae_ll[["1.3."]] <- paste0("1.3.", 1:5, ".")
yae_ll[["1.4."]] <- paste0("1.4.", 1:6, ".")

# return result as data.frame
d <- hier_compute(
  inp = yae_ll,
  root = "Total",
  method = "list",
  as = "df"
); d



