library(quanteda)


### Name: dfm_tolower
### Title: Convert the case of the features of a dfm and combine
### Aliases: dfm_tolower dfm_toupper fcm_tolower fcm_toupper

### ** Examples

# for a document-feature matrix
mydfm <- dfm(c("b A A", "C C a b B"), 
             toLower = FALSE, verbose = FALSE)
mydfm
dfm_tolower(mydfm) 
dfm_toupper(mydfm)
   
# for a feature co-occurrence matrix
myfcm <- fcm(tokens(c("b A A d", "C C a b B e")), 
             context = "document")
myfcm
fcm_tolower(myfcm) 
fcm_toupper(myfcm)   



