library(forcats)


### Name: fct_relabel
### Title: Automatically relabel factor levels, collapse as necessary
### Aliases: fct_relabel

### ** Examples

gss_cat$partyid %>% fct_count()
gss_cat$partyid %>% fct_relabel(~ gsub(",", ", ", .x)) %>% fct_count()

convert_income <- function(x) {
  regex <- "^(?:Lt |)[$]([0-9]+).*$"
  is_range <- grepl(regex, x)
  num_income <- as.numeric(gsub(regex, "\\1", x[is_range]))
  num_income <- trunc(num_income / 5000) * 5000
  x[is_range] <- paste0("Gt $", num_income)
  x
}
fct_count(gss_cat$rincome)
convert_income(levels(gss_cat$rincome))
rincome2 <- fct_relabel(gss_cat$rincome, convert_income)
fct_count(rincome2)



