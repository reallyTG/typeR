library(ezplot)


### Name: agg_data
### Title: Aggregates data
### Aliases: agg_data

### ** Examples

df = ez_data()
agg_data(df, c(Units = "units", Value = "value"))
agg_data(df["fct"])
agg_data(df[c("fct", "value")])
agg_data(df, "value", "fct")
agg_data(df, "value", c("fct", "year"))
agg_data(df, c(x = "year", y = "value"), c(x = "year"))



