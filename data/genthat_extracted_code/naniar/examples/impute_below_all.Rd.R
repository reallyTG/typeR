library(naniar)


### Name: impute_below_all
### Title: Impute data with values shifted 10% below range.
### Aliases: impute_below_all

### ** Examples


# you can impute data like so:
airquality %>%
  impute_below_all()

# However, this does not show you WHERE the missing values are.
# to keep track of them, you want to use `bind_shadow()` first.

airquality %>%
  bind_shadow() %>%
  impute_below_all()

# This identifies where the missing values are located, which means you
# can do things like this:

## Not run: 
##D library(ggplot2)
##D airquality %>%
##D   bind_shadow() %>%
##D   impute_below_all() %>%
##D   # identify where there are missings across rows.
##D   add_label_shadow() %>%
##D   ggplot(aes(x = Ozone,
##D              y = Solar.R,
##D              colour = any_missing)) +
##D   geom_point()
##D # Note that this ^^ is a long version of `geom_miss_point()`.
## End(Not run)




