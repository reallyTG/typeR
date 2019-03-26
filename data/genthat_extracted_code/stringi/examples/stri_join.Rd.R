library(stringi)


### Name: stri_join
### Title: Concatenate Character Vectors
### Aliases: stri_join stri_c stri_paste

### ** Examples

stri_join(1:13, letters)
stri_join(1:13, letters, sep='!')
stri_join(1:13, letters, collapse='?')
stri_join(1:13, letters, sep='!', collapse='?')
stri_join(c('abc', '123', '\u0105\u0104'),'###', 1:5, sep='...')
stri_join(c('abc', '123', '\u0105\u0104'),'###', 1:5, sep='...', collapse='?')

do.call(stri_c, list(c("a", "b", "c"), c("1", "2"), sep='!'))
do.call(stri_c, list(c("a", "b", "c"), c("1", "2"), sep='!', collapse='$'))




