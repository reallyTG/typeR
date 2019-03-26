library(jstor)


### Name: jst_get_total_pages
### Title: Calculate total pages
### Aliases: jst_get_total_pages

### ** Examples

# calculate pages from first and last page
first_pages <- sample(30:50, 10)
last_pages <- first_pages + sample(5:20, 10)
page_ranges <- rep(NA_character_, 10)

jst_get_total_pages(first_pages, last_pages, page_ranges)

# get pages from page range
jst_get_total_pages(NA_real_, NA_real_, "51 - 70")
jst_get_total_pages(NA_real_, NA_real_, "51 - 70, 350")
jst_get_total_pages(NA_real_, NA_real_, "350, 51 - 70")
jst_get_total_pages(NA_real_, NA_real_, "51 - 70, 80-100")
jst_get_total_pages(NA_real_, NA_real_, "51-70+350")



