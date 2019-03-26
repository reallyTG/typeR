library(DBI)


### Name: sqlInterpolate
### Title: Safely interpolate values into an SQL string
### Aliases: sqlInterpolate

### ** Examples

sql <- "SELECT * FROM X WHERE name = ?name"
sqlInterpolate(ANSI(), sql, name = "Hadley")

# This is safe because the single quote has been double escaped
sqlInterpolate(ANSI(), sql, name = "H'); DROP TABLE--;")



