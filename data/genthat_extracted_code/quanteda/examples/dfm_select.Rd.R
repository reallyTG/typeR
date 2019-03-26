library(quanteda)


### Name: dfm_select
### Title: Select features from a dfm or fcm
### Aliases: dfm_select dfm_remove dfm_keep fcm_select fcm_remove fcm_keep
### Keywords: dfm

### ** Examples

my_dfm <- dfm(c("My Christmas was ruined by your opposition tax plan.",
               "Does the United_States or Sweden have more progressive taxation?"),
             tolower = FALSE, verbose = FALSE)
my_dict <- dictionary(list(countries = c("United_States", "Sweden", "France"),
                          wordsEndingInY = c("by", "my"),
                          notintext = "blahblah"))
dfm_select(my_dfm, my_dict)
dfm_select(my_dfm, my_dict, case_insensitive = FALSE)
dfm_select(my_dfm, c("s$", ".y"), selection = "keep", valuetype = "regex")
dfm_select(my_dfm, c("s$", ".y"), selection = "remove", valuetype = "regex")
dfm_select(my_dfm, stopwords("english"), selection = "keep", valuetype = "fixed")
dfm_select(my_dfm, stopwords("english"), selection = "remove", valuetype = "fixed")

# select based on character length
dfm_select(my_dfm, min_nchar = 5)

# selecting on a dfm
txts <- c("This is text one", "The second text", "This is text three")
(dfm1 <- dfm(txts[1:2]))
(dfm2 <- dfm(txts[2:3]))
(dfm3 <- dfm_select(dfm1, dfm2, valuetype = "fixed", verbose = TRUE))
setequal(featnames(dfm2), featnames(dfm3))

tmpdfm <- dfm(c("This is a document with lots of stopwords.",
                "No if, and, or but about it: lots of stopwords."),
              verbose = FALSE)
tmpdfm
dfm_remove(tmpdfm, stopwords("english"))
toks <- tokens(c("this contains lots of stopwords",
                 "no if, and, or but about it: lots"),
               remove_punct = TRUE)
tmpfcm <- fcm(toks)
tmpfcm
fcm_remove(tmpfcm, stopwords("english"))



