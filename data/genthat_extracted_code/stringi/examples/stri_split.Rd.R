library(stringi)


### Name: stri_split
### Title: Split a String By Pattern Matches
### Aliases: stri_split stri_split_fixed stri_split_regex stri_split_coll
###   stri_split_charclass

### ** Examples

stri_split_fixed("a_b_c_d", "_")
stri_split_fixed("a_b_c__d", "_")
stri_split_fixed("a_b_c__d", "_", omit_empty=TRUE)
stri_split_fixed("a_b_c__d", "_", n=2, tokens_only=FALSE) # "a" & remainder
stri_split_fixed("a_b_c__d", "_", n=2, tokens_only=TRUE) # "a" & "b" only
stri_split_fixed("a_b_c__d", "_", n=4, omit_empty=TRUE, tokens_only=TRUE)
stri_split_fixed("a_b_c__d", "_", n=4, omit_empty=FALSE, tokens_only=TRUE)
stri_split_fixed("a_b_c__d", "_", omit_empty=NA)
stri_split_fixed(c("ab_c", "d_ef_g", "h", ""), "_", n=1, tokens_only=TRUE, omit_empty=TRUE)
stri_split_fixed(c("ab_c", "d_ef_g", "h", ""), "_", n=2, tokens_only=TRUE, omit_empty=TRUE)
stri_split_fixed(c("ab_c", "d_ef_g", "h", ""), "_", n=3, tokens_only=TRUE, omit_empty=TRUE)

stri_list2matrix(stri_split_fixed(c("ab,c", "d,ef,g", ",h", ""), ",", omit_empty=TRUE))
stri_split_fixed(c("ab,c", "d,ef,g", ",h", ""), ",", omit_empty=FALSE, simplify=TRUE)
stri_split_fixed(c("ab,c", "d,ef,g", ",h", ""), ",", omit_empty=NA, simplify=TRUE)
stri_split_fixed(c("ab,c", "d,ef,g", ",h", ""), ",", omit_empty=TRUE, simplify=TRUE)
stri_split_fixed(c("ab,c", "d,ef,g", ",h", ""), ",", omit_empty=NA, simplify=NA)

stri_split_regex(c("ab,c", "d,ef  ,  g", ",  h", ""),
   "\\p{WHITE_SPACE}*,\\p{WHITE_SPACE}*", omit_empty=NA, simplify=TRUE)

stri_split_charclass("Lorem ipsum dolor sit amet", "\\p{WHITE_SPACE}")
stri_split_charclass(" Lorem  ipsum dolor", "\\p{WHITE_SPACE}", n=3,
   omit_empty=c(FALSE, TRUE))

stri_split_regex("Lorem ipsum dolor sit amet",
   "\\p{Z}+") # see also stri_split_charclass




