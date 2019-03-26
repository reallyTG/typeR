library(yasp)


### Name: sentence
### Title: sentence
### Aliases: sentence

### ** Examples

compare <- function(x) cat(sprintf(' in: "%s"\nout: "%s"\n', x, sentence(x)))
compare("capitilized and period added")
compare("whitespace:added ,or removed ; like this.and this")
compare("periods and commas in numbers like 1,234.567 are fine !")
compare("colons can be punctuation or time : 12:00 !")
compare("only one punctuation mark at a time!.?,;")
compare("The first mark ,; is kept;,,with priority for terminal marks ;,.")

# vectorized like paste()
sentence(
 "The", c("first", "second", "third"), "letter is", letters[1:3],
 parens("uppercase:", sngl_quote(LETTERS[1:3])), ".")



