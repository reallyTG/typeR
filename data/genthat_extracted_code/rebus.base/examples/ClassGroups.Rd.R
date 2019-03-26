library(rebus.base)


### Name: ClassGroups
### Title: Character classes
### Aliases: ClassGroups alnum alpha blank cntrl digit graph lower
###   printable punct space upper hex_digit any_char grapheme newline dgt
###   wrd spc not_dgt not_wrd not_spc ascii_digit ascii_lower ascii_upper
###   ascii_alpha ascii_alnum char_range

### ** Examples

# R character classes
alnum()
alpha()
blank()
cntrl()
digit()
graph()
lower()
printable()
punct()
space()
upper()
hex_digit()

# Special chars
any_char()
grapheme()
newline()

# Generic classes
dgt()
wrd()
spc()

# Generic negated classes
not_dgt()
not_wrd()
not_spc()

# Non-locale-specific classes
ascii_digit()
ascii_lower()
ascii_upper()

# Don't provide a class wrapper
digit(char_class = FALSE) # same as DIGIT

# Match repeated values
digit(3)
digit(3, 5)
digit(0)
digit(1)
digit(0, 1)

# Ranges of characters
char_range(0, 7) # octal number

# Usage
(rx <- digit(3))
stringi::stri_detect_regex(c("123", "one23"), rx)

# Some classes behave differently under different engines
# In particular PRCE and Perl recognise all these characters
# as punctuation but ICU does not
p <- c(
  "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "[", "]", "{", "}", ";",
  ":", "'", '"', ",", "<", ">", ".", "/", "?", "\\", "|", "`", "~"
)
icu_matched <- stringi::stri_detect_regex(p, punct())
p[icu_matched]
p[!icu_matched]
pcre_matched <- grepl(punct(), p)
p[pcre_matched]
p[!pcre_matched]

# A grapheme is a character that can be defined by more than one code point
# PCRE does not recognise the concept.
x <- c("Chloe", "Chlo\u00e9", "Chlo\u0065\u0301")
stringi::stri_match_first_regex(x, "Chlo" %R% capture(grapheme()))

# newline() matches three types of line ending: \r, \n, \r\n.
# You can standardize line endings using
stringi::stri_replace_all_regex("foo\nbar\r\nbaz\rquux", NEWLINE, "\n")



