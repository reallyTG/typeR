library(stringi)


### Name: stri_wrap
### Title: Word Wrap Text to Format Paragraphs
### Aliases: stri_wrap

### ** Examples

s <- stri_paste(
   "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin ",
   "nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel ",
   "lorem. Etiam pellentesque aliquet tellus.")
cat(stri_wrap(s, 20, 0.0), sep="\n") # greedy
cat(stri_wrap(s, 20, 2.0), sep="\n") # dynamic
cat(stri_pad(stri_wrap(s), side='both'), sep="\n")




