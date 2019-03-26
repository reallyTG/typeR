library(passport)


### Name: country_format
### Title: Construct formatter function to format country codes as country
###   names
### Aliases: country_format

### ** Examples

if (require(ggplot2, quietly = TRUE)) {
    ggplot(data.frame(country = c("KOR", "MMR", "TWN", "COG"),
                      y = 1:4),
           aes(x = country, y = y)) +
        geom_col() +
        scale_x_discrete(labels = country_format(from = "iso3c"))
}




