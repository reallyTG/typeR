library(passport)


### Name: order_countries
### Title: Order a vector of countries
### Aliases: order_countries

### ** Examples

countries <- c("FR", "CP", "UZ", "BH", "BR")

order_countries(countries)

order_countries(countries, "ja")

order_countries(countries, rnorm(5))

order_countries(countries, grepl("F", countries), 1:5, decreasing = TRUE)

if (require(ggplot2, quietly = TRUE)) {
    df_countries <- data.frame(country = countries,
                               y = exp(1:5))

    ggplot(df_countries, aes(country, y)) +
        geom_col() +
        scale_x_discrete(
            limits = order_countries(df_countries$country,
                                     df_countries$y)[df_countries$y > 5],
            labels = country_format(to = "en-cia-local")
        )
}




