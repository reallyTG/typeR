library(quanteda)


### Name: tokens_segment
### Title: Segment tokens object by patterns
### Aliases: tokens_segment
### Keywords: internal tokens

### ** Examples

txts <- "Fellow citizens, I am again called upon by the voice of my country to
execute the functions of its Chief Magistrate. When the occasion proper for
it shall arrive, I shall endeavor to express the high sense I entertain of
this distinguished honor."
toks <- tokens(txts)

# split by any punctuation
toks_punc <- tokens_segment(toks, c(".", "?", "!"), valuetype = "fixed", 
                            pattern_position = "after")
toks_punc <- tokens_segment(toks, "^\\p{Sterm}$", valuetype = "regex", 
                            extract_pattern = FALSE, 
                            pattern_position = "after")



