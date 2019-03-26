library(catchr)


### Name: user_display
### Title: Display conditions in output terminal
### Aliases: user_display display_with

### ** Examples

make_warnings <- function() {
  warning("This warning has a call")
  warning("This warning does not", call. = FALSE)
  invisible("done")
}

# The crayon stylings won't work if `crayon` isn't installed.
catch_expr(make_warnings(), warning = c(display_with("pink"), muffle))
catch_expr(make_warnings(),
           warning = c(display_with(c("pink","bold"), include_call = FALSE), muffle))
catch_expr(make_warnings(), warning = c(display_with("inverse", cond_name=NULL), muffle))
# If you don't want to use crayon styles, just use `NULL`
catch_expr(make_warnings(), warning = c(display_with(NULL, cond_name="Warning"), muffle))

# You can get a lot of weird crayon styles
if (requireNamespace("crayon", quietly = TRUE) == TRUE) {
  freaky_colors <- crayon::strikethrough$yellow$bgBlue$bold$blurred
  catch_expr(make_warnings(),
             warning = c(function(x) user_display(x, freaky_colors), muffle))
}



