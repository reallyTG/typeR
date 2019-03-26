library(rebus.base)


### Name: capture
### Title: Capture a token, or not
### Aliases: capture group token engroup

### ** Examples

x <- "foo"
capture(x)
group(x)

# Usage
# capture is good with match functions
(rx_price <- capture(digit(1, Inf) %R% DOT %R% digit(2)))
(rx_quantity <- capture(digit(1, Inf)))
(rx_all <- DOLLAR %R% rx_price %R% " for " %R% rx_quantity)
stringi::stri_match_first_regex("The price was $123.99 for 12.", rx_all)

# group is mostly used with alternation.  See ?or.
(rx_spread <- group("peanut butter" %|% "jam" %|% "marmalade"))
stringi::stri_extract_all_regex(
  "You can have peanut butter, jam, or marmalade on your toast.",
  rx_spread
)



