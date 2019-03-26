library(stringi)


### Name: stri_pad_both
### Title: Pad (Center/Left/Right Align) a String
### Aliases: stri_pad_both stri_pad_left stri_pad_right stri_pad

### ** Examples

stri_pad_left("stringi", 10, pad="#")
stri_pad_both("stringi", 8:12, pad="*")
# center on screen:
cat(stri_pad_both(c("the", "string", "processing", "package"),
   getOption("width")*0.9), sep='\n')
cat(stri_pad_both(c("\ud6c8\ubbfc\uc815\uc74c", # takes width into account
   stri_trans_nfkd("\ud6c8\ubbfc\uc815\uc74c"), "abcd"),
   width=10), sep="\n")



