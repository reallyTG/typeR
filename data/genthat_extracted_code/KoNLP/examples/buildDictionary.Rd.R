library(KoNLP)


### Name: buildDictionary
### Title: buildDictionary
### Aliases: buildDictionary

### ** Examples

## Not run: 
##D dics <- c('sejong','woorimalsam')
##D category <- c('sports')
##D user_d <- data.frame(term="apple", tag='ncn')
##D buildDictionary(ext_dic = dics,category_dic_nms = category, user_dic = user_d, replace_usr_dic=F)
##D #accumulate user dictionary only
##D buildDictionary(ext_dic= "", user_dic = user_d, replace_usr_dic=F)
##D #get user dictionary as data.frame
##D usr_words  <- get_dictionary('user_dic')
## End(Not run)



