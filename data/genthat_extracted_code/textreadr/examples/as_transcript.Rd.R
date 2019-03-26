library(textreadr)


### Name: as_transcript
### Title: Coerce Text toTranscripts Into R
### Aliases: as_transcript

### ** Examples

## EXAMPLE 1
as_transcript("34    The New York Times reports a lot of words here.
12    Greenwire reports a lot of words.
31    Only three words.
 2    The Financial Times reports a lot of words.
 9    Greenwire short.
13    The New York Times reports a lot of words again.",
    col.names = c("NO", "ARTICLE"), sep = "   ")

## EXAMPLE 2
as_transcript("34..    The New York Times reports a lot of words here.
12..    Greenwire reports a lot of words.
31..    Only three words.
 2..    The Financial Times reports a lot of words.
 9..    Greenwire short.
13..    The New York Times reports a lot of words again.",
    col.names = c("NO", "ARTICLE"), sep = "\\.\\.")

## EXAMPLE 3
as_transcript("JAKE The New York Times reports a lot of words here.
JIM Greenwire reports a lot of words.
JILL Only three words.
GRACE The Financial Times reports a lot of words.
JIM Greenwire short.
JILL The New York Times reports a lot of words again.",
   person.regex = '(^[A-Z]{3,})'
)



