library(textclean)


### Name: replace_internet_slang
### Title: Replace Internet Slang
### Aliases: replace_internet_slang

### ** Examples

x <- c(
    "Marc the n00b needs to RTFM otherwise ymmv.",
    "TGIF and a big w00t!  The weekend is GR8!",
    "Will will do it",
    'w8...this PITA needs me to say LMGTFY...lmao.',
    NA
)

replace_internet_slang(x)
replace_internet_slang(x, ignore.case = FALSE)
replace_internet_slang(x, replacement = '<<SLANG>>')
replace_internet_slang(
    x, 
    replacement = paste0('{{ ', lexicon::hash_internet_slang[[2]], ' }}')
)



