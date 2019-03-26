## ----setup, include=FALSE------------------------------------------------
header_con <- file("vignette_header.html")
writeLines('<meta name="flattr:id" content="4zdzgd" />', header_con)
close(header_con)

## ---- include=FALSE, cache=FALSE-----------------------------------------
library(koRpus)
# manually add tag definition, the koRpus.lang.en package might be missing
koRpus::set.lang.support("kRp.POS.tags",
  ## tag and class definitions
  # en -- english
  list("en"=list(
    tag.class.def.words=matrix(c(
      "CC", "conjunction", "Coordinating conjunction",
      "CD", "number", "Cardinal number",
      "DT", "determiner", "Determiner",
      "EX", "existential", "Existential there",
      "FW", "foreign", "Foreign word",
      "IN", "preposition", "Preposition or subordinating conjunction",
      "IN/that", "preposition", "Preposition or subordinating conjunction",
      "JJ", "adjective", "Adjective",
      "JJR", "adjective", "Adjective, comparative",
      "JJS", "adjective", "Adjective, superlative",
      "LS", "listmarker", "List item marker",
      "MD", "modal", "Modal",
      "NN", "noun", "Noun, singular or mass",
      "NNS", "noun", "Noun, plural",
      "NP", "name", "Proper noun, singular",
      "NPS", "name", "Proper noun, plural",
      "NS", "noun", "Noun, plural", # undocumented, bug in parameter file?
      "PDT", "predeterminer", "Predeterminer",
      "POS", "possesive", "Possessive ending",
      "PP", "pronoun", "Personal pronoun",
      "PP$", "pronoun", "Possessive pronoun",
      "RB", "adverb", "Adverb",
      "RBR", "adverb", "Adverb, comparative",
      "RBS", "adverb", "Adverb, superlative",
      "RP", "particle", " Particle",
      "SYM", "symbol", "Symbol",
      "TO", "to", "to",
      "UH", "interjection", "Interjection",
      "VB", "verb", "Verb, base form of \"to be\"",
      "VBD", "verb", "Verb, past tense of \"to be\"",
      "VBG", "verb", "Verb, gerund or present participle of \"to be\"",
      "VBN", "verb", "Verb, past participle of \"to be\"",
      "VBP", "verb", "Verb, non-3rd person singular present of \"to be\"",
      "VBZ", "verb", "Verb, 3rd person singular present of \"to be\"",
      "VH", "verb", "Verb, base form of \"to have\"",
      "VHD", "verb", "Verb, past tense of \"to have\"",
      "VHG", "verb", "Verb, gerund or present participle of \"to have\"",
      "VHN", "verb", "Verb, past participle of \"to have\"",
      "VHP", "verb", "Verb, non-3rd person singular present of \"to have\"",
      "VHZ", "verb", "Verb, 3rd person singular present of \"to have\"",
      "VV", "verb", "Verb, base form",
      "VVD", "verb", "Verb, past tense",
      "VVG", "verb", "Verb, gerund or present participle",
      "VVN", "verb", "Verb, past participle",
      "VVP", "verb", "Verb, non-3rd person singular present",
      "VVZ", "verb", "Verb, 3rd person singular present",
      "WDT", "determiner", "Wh-determiner",
      "WP", "pronoun", "Wh-pronoun",
      "WP$", "pronoun", "Possessive wh-pronoun",
      "WRB", "adverb", "Wh-adverb"
      ), ncol=3, byrow=TRUE, dimnames=list(c(),c("tag","wclass","desc"))),
    tag.class.def.punct=matrix(c(
      ",", "comma", "Comma", # not in guidelines
      "(", "punctuation", "Opening bracket", # not in guidelines
      ")", "punctuation", "Closing bracket", # not in guidelines
      ":", "punctuation", "Punctuation", # not in guidelines
      "``", "punctuation", "Quote", # not in guidelines
      "''", "punctuation", "End quote", # not in guidelines
      "#", "punctuation", "Punctuation", # not in guidelines
      "$", "punctuation", "Punctuation" # not in guidelines
      ), ncol=3, byrow=TRUE, dimnames=list(c(),c("tag","wclass","desc"))),
    tag.class.def.sentc=matrix(c(
      "SENT", "fullstop", "Sentence ending punctuation" # not in guidelines
      ), ncol=3, byrow=TRUE, dimnames=list(c(),c("tag","wclass","desc")))
    )
  )
)
# we'll also fool hyphen() into believing "en" is an available language,
# while actually using a previously hyphenated object
fake.hyph.en <- new(
  "kRp.hyph.pat",
  lang="en",
  pattern=matrix(
    c(".im5b", ".imb", "0050"),
    ncol=3,
    dimnames=list(c(), c("orig", "char", "nums"))
  )
)
set.hyph.support(list("en"=fake.hyph.en))

## ---- set-options, echo=FALSE, cache=FALSE-----------------------------------------
options(width=85)

## ---- eval=FALSE-------------------------------------------------------------------
#  # install the language support package
#  install.koRpus.lang("en")
#  # load the package
#  library(koRpus.lang.en)

## ---- eval=FALSE-------------------------------------------------------------------
#  tagged.text <- treetag(
#    "sample_text.txt",
#    treetagger="manual",
#    lang="en",
#    TT.options=list(
#      path="~/bin/treetagger/",
#      preset="en"
#    ),
#    doc_id="sample"
#  )

## ---- include=FALSE, cache=FALSE---------------------------------------------------
tagged.text <- dget("sample_text_treetagged_dput.txt")

## ----------------------------------------------------------------------------------
tagged.text

## ----------------------------------------------------------------------------------
(tokenized.text <- tokenize(
    "sample_text.txt",
    lang="en",
    doc_id="sample"
))

## ----------------------------------------------------------------------------------
taggedText(tagged.text)[26:34,]

## ----------------------------------------------------------------------------------
head(tagged.text[["lttr"]], n=50)

## ----------------------------------------------------------------------------------
tagged.text[1:5,]

## ---- eval=FALSE-------------------------------------------------------------------
#  describe(tagged.text)

## ---- echo=FALSE-------------------------------------------------------------------
(txt_desc <- describe(tagged.text))
txt_desc_lttr <- txt_desc[["lttr.distrib"]]

## ---- eval=FALSE-------------------------------------------------------------------
#  lex.div(
#    tagged.text,
#    measure=c("TTR", "MSTTR", "MATTR","HD-D", "MTLD", "MTLD-MA"),
#    char=c("TTR", "MATTR","HD-D", "MTLD", "MTLD-MA")
#  )

## ---- echo=FALSE-------------------------------------------------------------------
lex.div(
  tagged.text,
  measure=c("TTR", "MSTTR", "MATTR","HD-D", "MTLD", "MTLD-MA"),
  char=c("TTR", "MATTR","HD-D", "MTLD", "MTLD-MA"),
  quiet=TRUE
)

## ----------------------------------------------------------------------------------
maas(tagged.text)

## ---- eval=FALSE-------------------------------------------------------------------
#  ttr.res <- TTR(tagged.text, char=TRUE)
#  plot(ttr.res@TTR.char, type="l", main="TTR degredation over text length")

## ---- echo=FALSE-------------------------------------------------------------------
ttr.res <- TTR(tagged.text, char=TRUE, quiet=TRUE)
plot(ttr.res@TTR.char, type="l", main="TTR degredation over text length")

## ----------------------------------------------------------------------------------
MSTTR(tagged.text, segment=92)

## ---- eval=FALSE-------------------------------------------------------------------
#  LCC.en <- read.corp.LCC("~/downloads/corpora/eng_news_2010_1M-text.tar")

## ---- eval=FALSE-------------------------------------------------------------------
#  query(LCC.en, "word", "what")

## ---- eval=FALSE-------------------------------------------------------------------
#  query(LCC.en, "pmio", c(780, 790))

## ---- eval=FALSE-------------------------------------------------------------------
#  freq.analysis.res <- freq.analysis(tagged.text, corp.freq=LCC.en)

## ---- eval=FALSE-------------------------------------------------------------------
#  taggedText(freq.analysis.res)

## ---- eval=FALSE-------------------------------------------------------------------
#  describe(freq.analysis.res)[["sentc.length"]]

## ---- eval=FALSE-------------------------------------------------------------------
#  describe(freq.analysis.res)$classes

## ---- eval=FALSE-------------------------------------------------------------------
#  (hyph.txt.en <- hyphen(tagged.text))

## ---- include=FALSE, cache=FALSE---------------------------------------------------
hyph.txt.en <- dget("sample_text_hyphenated_dput.txt")

## ----------------------------------------------------------------------------------
hyph.txt.en

## ----------------------------------------------------------------------------------
head(hyphenText(hyph.txt.en))

## ---- eval=FALSE-------------------------------------------------------------------
#  hyph.txt.en <- correct.hyph(hyph.txt.en)

## ---- eval=FALSE-------------------------------------------------------------------
#  hyph.txt.en <- correct.hyph(hyph.txt.en, word="mech-a-nisms", hyphen="mech-a-ni-sms")

## ---- eval=FALSE-------------------------------------------------------------------
#  readbl.txt <- readability(tagged.text, hyphen=hyph.txt.en)

## ---- echo=FALSE-------------------------------------------------------------------
suppressWarnings(readbl.txt <- readability(tagged.text, hyphen=hyph.txt.en))

## ----------------------------------------------------------------------------------
readbl.txt

## ----------------------------------------------------------------------------------
summary(readbl.txt)

## ----------------------------------------------------------------------------------
summary(readbl.txt, flat=TRUE)

## ----------------------------------------------------------------------------------
flesch.res <- flesch(tagged.text, hyphen=hyph.txt.en)
lix.res <- LIX(tagged.text)   # LIX doesn't need syllable count
lix.res

## ---- eval=FALSE-------------------------------------------------------------------
#  guessed <- guess.lang(
#    file.path(find.package("koRpus"),"tests","testthat","sample_text.txt"),
#    udhr.path="~/downloads/udhr_txt.zip"
#  )
#  summary(guessed)

