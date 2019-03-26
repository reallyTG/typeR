library(stringi)


### Name: stri_join_list
### Title: Concatenate Strings in a List
### Aliases: stri_join_list stri_c_list stri_paste_list

### ** Examples

stri_join_list(stri_extract_all_words(c("Lorem ipsum dolor sit amet.",
"Get a life.")), sep=", ")

stri_join_list(stri_extract_all_words(c("Lorem ipsum dolor sit amet.",
"Get a life.")), sep=", ", collapse=". ")

stri_join_list(stri_extract_all_regex(c("R is OK.", "123 456", "Hey!"), "\\p{L}+"), " ")

stri_join_list(stri_extract_all_regex(c("R is OK.", "123 456", "Hey!"),
"\\p{L}+", omit_no_match=TRUE), " ", " -- ")




