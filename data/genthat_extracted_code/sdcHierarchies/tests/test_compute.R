context("Compute hierarchies")

## nuts: digits 1-2 (nuts1), digit 3 (nut2), digits 4-5 (nuts3)
## all strings have equal length but total is not encoded in these values
geo_m <- c(
  "01051", "01053", "01054", "01055", "01056", "01057", "01058", "01059",
  "01060", "01061", "01062",
  "02000",
  "03151", "03152", "03153", "03154", "03155", "03156", "03157", "03158",
  "03251", "03252", "03254", "03255",
  "03256", "03257", "03351", "03352", "03353", "03354", "03355", "03356",
  "03357", "03358", "03359", "03360",
  "03361", "03451", "03452", "03453", "03454", "03455", "03456",
  "10155")


# no dim_spec given
expect_error(
  hier_compute(
    inp = geo_m,
    root = "Tot",
    method = "endpos")
)

dim_endpos <- hier_compute(
  inp = geo_m,
  dim_spec = c(2, 3, 5),
  root = "Tot",
  method = "endpos"
)

# no dim_spec given
expect_error(
  hier_compute(
    inp = geo_m,
    root = "Tot",
    method = "len"
  )
)

dim_len <- hier_compute(
  inp = geo_m,
  dim_spec = c(2, 1, 2),
  root = "Tot",
  method = "len"
)

expect_identical(
  hier_convert(dim_endpos, as = "df"),
  hier_convert(dim_len, as = "df")
)

# Total not contained
yae_h <- c(
  "1.1.1.", "1.1.2.",
  "1.2.1.", "1.2.2.", "1.2.3.", "1.2.4.", "1.2.5.", "1.3.1.",
  "1.3.2.", "1.3.3.", "1.3.4.", "1.3.5.",
  "1.4.1.", "1.4.2.", "1.4.3.", "1.4.4.", "1.4.5.",
  "1.5.", "1.6.", "1.7.", "1.8.", "1.9.", "2.", "3.")

dim_endpos <- hier_compute(
  inp = yae_h,
  dim_spec = c(2, 4, 6),
  root = "Tot",
  method = "endpos"
)

dim_len <- hier_compute(
  inp = yae_h,
  dim_spec = c(2, 2, 2),
  root = "Tot",
  method = "len"
)

expect_identical(
  hier_convert(dim_endpos, as = "df"),
  hier_convert(dim_len, as = "df")
)
expect_identical(
  hier_convert(dim_endpos, as = "json"),
  hier_convert(dim_len, as = "json")
)
expect_identical(
  hier_convert(dim_endpos, as = "dt"),
  hier_convert(dim_len, as = "dt")
)
expect_identical(
  hier_convert(dim_endpos, as = "argus"),
  hier_convert(dim_len, as = "argus")
)
expect_identical(
  hier_convert(dim_endpos, as = "code"),
  hier_convert(dim_len, as = "code")
)
expect_identical(
  hier_convert(dim_endpos, as = "sdc"),
  hier_convert(dim_len, as = "sdc")
)


context("Compute hierarchies from nested lists")
# Total not contained
ll <- list()
ll[["Tot"]] <- letters[1:3]
ll[["a"]] <- "a1"

# root must be given
expect_error(
  hier_compute(inp = ll, method = "list")
)

# non-existing name for overall total
expect_error(
  hier_compute(inp = ll, root = "x", method = "list")
)

expect_error(
  hier_compute(inp = ll, root = "a1", method = "list")
)

ll <- append(ll, list("b1", "b2"))
# some elements are not named
expect_error(
  hier_compute(inp = ll, root = "Tot", method = "list")
)

ll <- ll[1:2]
ll$b <- paste0("b", 1:3)
ll$b1 <- "b1a"
ll$c <- "c1a"
ll$c1a <- "c1a_1"
d <- hier_compute(inp = ll, root = "Tot", method = "list")

expect_identical(
  hier_info(d, "c1a_1")$is_bogus,
  TRUE
)

expect_identical(
  hier_info(d, "c1a_1")$parent,
  "c1a"
)
expect_identical(
  hier_info(d, "c1a_1")$contributing_codes,
  "c1a_1"
)

# b1a is a bugus-code (the only one contributing to b1)
expect_identical(
  hier_info(d, "b")$contributing_codes,
  c("b1", "b2", "b3")
)

df <- hier_convert(d, as = "df")
expect_is(df, "data.frame")
expect_equal(nrow(df), 11)

context("Testing edge-cases")
expect_error(
  .contributing_codes(h = d, node_name = "x")
)

# not valid hierarchies
expect_error(
  .is_valid(tree = NULL)
)
expect_error(
  .is_valid(tree = data.frame())
)

# different values for encoded overall total
inp <- c("TotA", "TOtB")
expect_error(
  hier_compute(
    inp = inp,
    dim_spec = c(3, 1),
    root = NULL,
    method = "len")
)

# not a named list
expect_error(
  hier_compute(
    inp = list(),
    root = "Tot",
    method = "list"
  )
)

# overall total found in sublevels
ll <- list()
ll$Tot <- letters[1:2]
ll$a <- c("Tot", "x")
expect_error(
  hier_compute(
    inp = ll,
    root = "Tot",
    method = "list"
  )
)

# sublevels not found as inputs
ll <- list()
ll$Tot <- letters[1:2]
ll$A <- c("a1")
expect_error(
  hier_compute(
    inp = ll,
    root = "Tot",
    method = "list"
  )
)
