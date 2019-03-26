library(rqdatatable)


### Name: make_dt_lookup_by_column
### Title: Lookup by column function factory.
### Aliases: make_dt_lookup_by_column

### ** Examples


df = data.frame(x = c(1, 2, 3, 4),
                y = c(5, 6, 7, 8),
                choice = c("x", "y", "x", "z"),
                stringsAsFactors = FALSE)
make_dt_lookup_by_column("choice", "derived")(df)

# # base-R implementation
# df %.>% lookup_by_column(., "choice", "derived")
# # # data.table implementation (requies rquery 1.1.0, or newer)
# # df %.>% lookup_by_column(., "choice", "derived",
# #                          f_dt_factory = rqdatatable::make_dt_lookup_by_column)




