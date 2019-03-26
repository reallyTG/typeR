library(waffle)


### Name: waffle
### Title: Make waffle (square pie) charts
### Aliases: waffle

### ** Examples

parts <- c(80, 30, 20, 10)
chart <- waffle(parts, rows=8)
# print(chart)

# library(extrafont)
# waffle(parts, rows=8, use_glyph="shield")

parts <- c(One=80, Two=30, Three=20, Four=10)
chart <- waffle(parts, rows=8)
# print(chart)



