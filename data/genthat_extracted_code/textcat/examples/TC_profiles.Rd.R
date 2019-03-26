library(textcat)


### Name: TC_profiles
### Title: TextCat N-Gram Profiles
### Aliases: TC_char_profiles TC_byte_profiles
### Keywords: datasets

### ** Examples

## Languages in the TC byte profiles:
names(TC_byte_profiles)
## Languages only in the TC byte profiles:
setdiff(names(TC_byte_profiles), names(TC_char_profiles))
## Key options used for the profiles:
attr(TC_byte_profiles, "options")[c("n", "size", "reduce", "useBytes")]
attr(TC_char_profiles, "options")[c("n", "size", "reduce", "useBytes")]



