## ----message=FALSE-------------------------------------------------------
library(htmltab)

url <- "http://christianrubba.com/cran/htmltab/vignette/Demography%20of%20the%20United%20Kingdom%20-%20Wikipedia.html"
ukLang <- htmltab(doc = url, which = "//th[text() = 'Ability']/ancestor::table")
head(ukLang)

## ----message=FALSE-------------------------------------------------------
library(tidyr)

ukLang <- gather(ukLang, key, value, -Ability)

## ------------------------------------------------------------------------
ukLang <- separate(ukLang, key, into = c("region", "language", "statistic"), sep = " >> ")
head(ukLang)

## ------------------------------------------------------------------------
url <- "http://christianrubba.com/cran/htmltab/vignette/New%20Zealand%20general%20election,%202002%20-%20Wikipedia.html"
xp <- "//caption[starts-with(text(), 'Electorate results')]/ancestor::table"
body_xp <- "//tr[./td[not(@colspan = '8')]]"

nz1 <- htmltab(doc = url, which = xp, body = body_xp, encoding = "UTF-8")
head(nz1)

## ------------------------------------------------------------------------
nz2 <- htmltab(doc = url, which = xp, header = 1 + "//tr/td[@colspan = '8']",
               body = "//tr[./td[not(@colspan = '10')]]", encoding = "UTF-8")

## ------------------------------------------------------------------------
tail(nz2, 9)

