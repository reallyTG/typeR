## ----basic-examples------------------------------------------------------
library("phonics")

x1 <- "Catherine"
x2 <- "Kathryn"
x3 <- "Katrina"
x4 <- "William"

x <- c(x1, x2, x3, x4)

soundex(x1)
soundex(x2)
soundex(x)

refinedSoundex(x1)
refinedSoundex(x2)

## ----soundex-test-example------------------------------------------------
soundex(x1) == soundex(x2)
soundex(x2) == soundex(x3)

## ----mra-example---------------------------------------------------------
(mra1 = mra_encode("Katherine"))
(mra2 = mra_encode("Catherine"))
(mra3 = mra_encode("Katarina"))

mra_compare(mra1, mra2)
mra_compare(mra1, mra3)
mra_compare(mra2, mra3)

## ----mra-kw-example------------------------------------------------------
mra_compare(mra_encode("Catherine"), mra_encode("William"))

