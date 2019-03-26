library(cli)


### Name: rule
### Title: Make a rule with one or two text labels
### Aliases: rule

### ** Examples


## Simple rule
rule()

## Double rule
rule(line = 2)

## Bars
rule(line = "bar2")
rule(line = "bar5")

## Left label
rule(left = "Results")

## Centered label
rule(center = " * RESULTS * ")

## Colored labels
rule(center = col_red(" * RESULTS * "))

## Colored line
rule(center = col_red(" * RESULTS * "), line_col = "red")

## Custom line
rule(center = "TITLE", line = "~")

## More custom line
rule(center = "TITLE", line = col_blue("~-"))

## Even more custom line
rule(center = bg_red(" ", symbol$star, "TITLE",
  symbol$star, " "),
  line = "\u2582",
  line_col = "orange")



