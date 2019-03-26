library(chinese.misc)


### Name: slim_text
### Title: Remove Words through Speech Tagging
### Aliases: slim_text

### ** Examples

require(jiebaR)
cutter <- jiebaR::worker()
# Give some English words a new tag.
new_user_word(cutter, c("aaa", "bbb", "ccc"),  rep("x", 3))
x <- "we have new words: aaa, bbb, ccc."
# The default is to keep English words.
slim_text(x, mycutter = cutter)
# Remove words tagged as "eng" but others are kept.
slim_text(x, mycutter = cutter, rm_eng = TRUE)
# Remove any word that only has a-zA-Z, 
# even when rm_eng = FALSE.
slim_text(x, mycutter = cutter, rm_eng = TRUE, rm_alpha = TRUE)
slim_text(x, mycutter = cutter, rm_eng = FALSE, rm_alpha = TRUE)



