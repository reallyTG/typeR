library(PROscorerTools)


### Name: msgWrap
### Title: msgWrap
### Aliases: msgWrap

### ** Examples

txt <- "If you use 'itemsrev' to indicate items that
        must be reverse-coded before scoring,
        you must provide a valid numeric range to 'minmax'.
        For example, if your lowest possible item response
        is 0 and your highest possible response is 4,
        you would use 'minmax = c(0, 4)'."

warning(msgWrap(msg = txt))



