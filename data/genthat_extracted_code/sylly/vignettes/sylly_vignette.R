## ----setup, include=FALSE------------------------------------------------
header_con <- file("vignette_header.html")
writeLines('<meta name="flattr:id" content="4zdzgd" />', header_con)
close(header_con)

## ---- eval=FALSE---------------------------------------------------------
#  sampleText <- c("This", "is", "a", "rather", "stupid", "demonstration")
#  library(sylly.en)
#  hyph.txt.en <- hyphen(sampleText, hyph.pattern="en")

## ---- eval=FALSE---------------------------------------------------------
#  url.is.pattern <- url("http://tug.ctan.org/tex-archive/language/hyph-
#  utf8/tex/generic/hyph-utf8/patterns/txt/hyph-is.pat.txt")
#  hyph.is <- read.hyph.pat(url.is.pattern, lang="is")
#  close(url.is.pattern)
#  hyph.txt.is <- hyphen(icelandicSampleText, hyph.pattern=hyph.is)

## ---- eval=FALSE---------------------------------------------------------
#  hyphenText(hyph.txt.en)

## ---- eval=FALSE---------------------------------------------------------
#  hyph.txt.en <- correct.hyph(hyph.txt.en)

## ---- eval=FALSE---------------------------------------------------------
#  hyph.txt.en <- correct.hyph(hyph.txt.en, word="primary", hyphen="pri-ma-ry")

## ---- eval=FALSE---------------------------------------------------------
#  set.sylly.env(hyph.cache.file="~/sylly_cache.Rdata")

## ---- eval=FALSE---------------------------------------------------------
#  options(
#    sylly=list(
#      hyph.cache.file="~/sylly_cache.RData"
#    )
#  )

