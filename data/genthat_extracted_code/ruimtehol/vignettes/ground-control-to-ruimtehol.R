### R code from vignette source 'ground-control-to-ruimtehol.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: preliminaries
###################################################
options(prompt = "R> ", continue = "+   ")
options(prompt = " ", continue = "   ")
set.seed(123456789)


###################################################
### code chunk number 2: ground-control-to-ruimtehol.Rnw:81-84
###################################################
library(ruimtehol)
data("dekamer", package = "ruimtehol")
str(dekamer)


###################################################
### code chunk number 3: ground-control-to-ruimtehol.Rnw:99-107
###################################################
dekamer$x <- strsplit(dekamer$question, "\\W")
dekamer$x <- lapply(dekamer$x, FUN = function(x) setdiff(x, ""))
dekamer$x <- sapply(dekamer$x, FUN = function(x) paste(x, collapse = " "))
dekamer$x <- tolower(dekamer$x)
dekamer$y <- strsplit(dekamer$question_theme, split = ",")
dekamer$y <- lapply(dekamer$y, FUN=function(x) gsub(" ", "-", x))
dekamer$x[1:2]
dekamer$y[1:2]


###################################################
### code chunk number 4: ground-control-to-ruimtehol.Rnw:115-122
###################################################
set.seed(321)
model <- embed_tagspace(x = dekamer$x, y = dekamer$y, 
                        early_stopping = 0.8, validationPatience = 10,
                        dim = 50, 
                        lr = 0.01, epoch = 40, loss = "softmax", adagrad = TRUE, 
                        similarity = "cosine", negSearchLimit = 50,
                        ngrams = 2, minCount = 2)


###################################################
### code chunk number 5: ground-control-to-ruimtehol.Rnw:124-125
###################################################
model


###################################################
### code chunk number 6: ground-control-to-ruimtehol.Rnw:144-145
###################################################
plot(model)


###################################################
### code chunk number 7: ground-control-to-ruimtehol.Rnw:151-154
###################################################
dict <- starspace_dictionary(model)
str(dict)
length(dict$labels)


###################################################
### code chunk number 8: ground-control-to-ruimtehol.Rnw:163-165
###################################################
emb <- as.matrix(model)
dim(emb)


###################################################
### code chunk number 9: ground-control-to-ruimtehol.Rnw:170-173
###################################################
emb_words  <- as.matrix(model, type = "words")
emb_labels <- as.matrix(model, type = "labels", prefix = FALSE)
e <- starspace_embedding(model, x = c("__label__VERVOERBELEID", "geld"), type = "ngram")


###################################################
### code chunk number 10: ground-control-to-ruimtehol.Rnw:178-179
###################################################
e <- starspace_embedding(model, c("nationale loterij"), type = "ngram")


###################################################
### code chunk number 11: ground-control-to-ruimtehol.Rnw:186-190
###################################################
text <- c("de nmbs heeft het treinaanbod uitgebreid via onteigening ...",
          "de migranten komen naar europa de asielcentra ...")
emb_text <- starspace_embedding(model, text)
dim(emb_text)


###################################################
### code chunk number 12: ground-control-to-ruimtehol.Rnw:197-198
###################################################
predict(model, "de migranten komen naar europa de asielcentra ...")


###################################################
### code chunk number 13: ground-control-to-ruimtehol.Rnw:203-204
###################################################
embedding_similarity(emb_text, emb_labels, type = "cosine", top_n = 5)


###################################################
### code chunk number 14: ground-control-to-ruimtehol.Rnw:209-210
###################################################
starspace_knn(model, "de migranten komen naar europa de asielcentra ...", k = 5)


###################################################
### code chunk number 15: ground-control-to-ruimtehol.Rnw:217-230
###################################################
targetdocs <- c("__label__FISCALITEIT", 
                "__label__OVERHEIDSADMINISTRATIE", 
                "__label__MIGRATIEBELEID", 
                "__label__POLITIE", 
                "__label__BUITENLANDS-BELEID", 
                "__label__ECONOMISCH-BELEID", 
                "de migranten komen naar europa ZZZ", 
                "__label__PERSONEEL")
predict(model, "de migranten komen naar europa de asielcentra ...", 
        basedoc = targetdocs)
embedding_similarity(
  starspace_embedding(model, "de migranten komen naar europa de asielcentra ..."),
  starspace_embedding(model, targetdocs), top_n = 3)


###################################################
### code chunk number 16: ground-control-to-ruimtehol.Rnw:238-240
###################################################
starspace_save_model(model, file = "textspace.ruimtehol")
model <- starspace_load_model("textspace.ruimtehol")


###################################################
### code chunk number 17: ground-control-to-ruimtehol.Rnw:243-244
###################################################
invisible(file.remove("textspace.ruimtehol"))


