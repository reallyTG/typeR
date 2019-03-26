## ----ex1-----------------------------------------------------------------
library("wrapr")

'a' := 5

c('a' := 5, 'b' := 6)

c('a', 'b') := c(5, 6)

## ----key1----------------------------------------------------------------
`:=` <- wrapr::`:=` # in case data.tables "catch calls" definition is active

key = 'keycode'
key := 'value'

## ----print, eval=FALSE---------------------------------------------------
#  help(`:=`, package = 'wrapr')

